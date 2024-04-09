import * as core from '@actions/core'
import { string, object, number } from 'yup'
import { parseColumns } from '@munkit/column'
import {
  WebhookClient,
  EmbedBuilder,
  ActionRowBuilder,
  ButtonBuilder,
  ButtonStyle
} from 'discord.js'

export async function run(): Promise<void> {
  const schema = object({
    message: string().required().trim(),
    columns: string().required().trim(),
    webhookUrl: string().required().trim(),
    color: number().integer().required(),
    threadId: string().trim().optional().nullable()
  })

  const inputs = schema.cast({
    message: core.getInput('message'),
    columns: core.getInput('columns'),
    webhookUrl: core.getInput('webhook-url'),
    color: core.getInput('color'),
    threadId: core.getInput('thread-id')
  })

  const client = new WebhookClient({
    url: inputs.webhookUrl
  })

  const columns = parseColumns(inputs.columns)
  const embed = new EmbedBuilder().setColor(inputs.color).addFields(
    columns
      .filter(column => ['inline', 'full'].includes(column.variant))
      .map(column => ({
        name: column.title,
        value: column.content,
        inline: column.variant === 'inline'
      }))
  )

  const components = columns
    .filter(column =>
      ['button'].some(variant => column.variant.includes(variant))
    )
    .map(column => {
      if (column.variant.includes('button')) {
        const style = ((column.variant.split(':')[1] as any) ??
          'PRIMARY') as ButtonStyle
        return new ActionRowBuilder<ButtonBuilder>().addComponents(
          new ButtonBuilder()
            .setStyle(style)
            .setLabel(column.title)
            .setURL(column.content)
        )
      }

      throw new Error('Invalid column variant')
    })

  try {
    await client.send({
      embeds: [embed],
      content: inputs.message,
      threadId: inputs.threadId || undefined,
      components: components
    })
    core.info('Message sent')
  } catch (err: any) {
    core.error(err.message)
    core.setFailed(err.message)
  }
}
