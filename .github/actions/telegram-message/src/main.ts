import * as core from '@actions/core'
import { string, object } from 'yup'
import { escape } from 'lodash'
import fetch from 'node-fetch'

const lineBreak = `&#10;`

type Column = {
  title: string
  content: string
  placement: string
}

export function htmlEscape(str: string) {
  return str.replace(/<html-escape>((.|\n|\r\n)*?)<\/html-escape>/, (_, p1) => {
    return escape(p1).replace(/[\r\n]/gm, lineBreak)
  })
}

export function parseColumns(columns: string) {
  const columnContentSchema = string().required()
  const columnPlacementSchema = string().required().oneOf(['full', 'inline'])
  const columnTitleSchema = string().required()

  return columns
    .split('|W|')
    .map(e => e.trim())
    .slice(1)
    .reduce((acc, column, index) => {
      if (index % 3 === 0) {
        acc.push({
          content: '',
          title: '',
          placement: ''
        })
      }

      const currentColumn = acc[acc.length - 1]

      switch (index % 3) {
        case 0:
          currentColumn.placement = columnPlacementSchema.cast(column)
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

export function columnsToMessage(columns: Column[]) {
  return columns
    .map(column => {
      const content = htmlEscape(column.content)

      return column.placement === 'full'
        ? `▪️ <b>${column.title}</b>${lineBreak}${content}`
        : `▪️ <b>${column.title}</b>: ${content}`
    })
    .join(lineBreak)
}

export async function run(): Promise<void> {
  const schema = object({
    message: string().required().trim(),
    columns: string().required().trim(),
    groupId: string().required().trim(),
    token: string().required().trim(),
    topic: string().optional()
  })

  const inputs = schema.cast({
    message: core.getInput('message', { required: true }),
    columns: core.getInput('columns', { required: true }),
    groupId: core.getInput('group', { required: true }),
    token: core.getInput('token', { required: true }),
    topic: core.getInput('topic')
  })

  const message = [
    inputs.message,
    lineBreak,
    lineBreak,
    columnsToMessage(parseColumns(inputs.columns))
  ].join('')

  console.log(message)

  try {
    const response = await fetch(
      `https://api.telegram.org/bot${inputs.token}/sendMessage`,
      {
        method: 'post',
        body: JSON.stringify({
          chat_id: inputs.groupId,
          text: message,
          parse_mode: 'HTML',
          disable_web_page_preview: true,
          reply_to_message_id: inputs.topic || undefined,
          headers: { 'Content-Type': 'application/json' }
        })
      }
    )

    if (!response.ok) {
      throw new Error(`Request failed with status ${response.status}`)
    }
  } catch (err: any) {
    console.error(err.message, err.stack)
    core.error(err.message)
    if (err.response) {
      core.error(JSON.stringify(err.response.data))
    }
    core.setFailed(err.message)
  }
}
