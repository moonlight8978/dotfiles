import * as core from '@actions/core'
import axios, { AxiosResponse } from 'axios'
import { string, object } from 'yup'
import { parseColumns } from '@munkit/column'

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
    inline: column.variant === 'inline'
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
    })
    .catch(err => {
      core.error(err.message)
      if (err.response) {
        core.error(err.response.data)
        core.error(err.response.request.body)
      }
      core.setFailed(err.message)
    })
}
