import * as core from '@actions/core'
import axios from 'axios'
import { number, string, object } from 'yup'

type Column = {
  title: string
  content: string
  width: string
}

function parseColumns(columns: string) {
  const columnContentSchema = string().required()
  const columnWidthSchema = string().required().oneOf(['full', 'inline'])
  const columnTitleSchema = string().required()

  return columns
    .split('|W|')
    .map(e => e.trim())
    .filter(Boolean)
    .reduce((acc, column, index) => {
      if (index % 3 === 0) {
        acc.push({
          content: '',
          title: '',
          width: 'full'
        })
      }

      const currentColumn = acc[acc.length - 1]

      switch (index % 3) {
        case 0:
          currentColumn.width = columnWidthSchema.cast(column)
          break

        case 1:
          currentColumn.title = columnTitleSchema.cast(column)
          break

        case 2:
          currentColumn.content = columnContentSchema.cast(column)
          break
      }

      return acc
    }, [] as Column[])
}

export async function run(): Promise<void> {
  const schema = object({
    message: string().required().trim(),
    columns: string().required().trim(),
    webhookUrl: string().required().trim(),
    color: string().required().trim()
  })

  const inputs = schema.cast({
    message: core.getInput('message'),
    columns: core.getInput('columns'),
    webhookUrl: core.getInput('webhook-url'),
    color: core.getInput('color')
  })

  const embeds = parseColumns(inputs.columns).map(column => ({
    name: column.title,
    value: column.content,
    inline: column.width === 'inline'
  }))

  await axios
    .post(
      inputs.webhookUrl,
      {
        content: inputs.message,
        embeds:
          embeds.length > 0
            ? [
                {
                  color: inputs.color,
                  fields: embeds
                }
              ]
            : undefined
      },
      {
        headers: {
          'Content-Type': 'application/json'
        },
        params: {
          wait: 'true'
        }
      }
    )
    .then(() => {
      core.info('Message sent')
      core.debug(JSON.stringify(embeds))
    })
    .catch(err => {
      core.error(err.message)
      if (err.response) {
        core.error(err.response.data)
      }
      core.setFailed(err.message)
    })
}
