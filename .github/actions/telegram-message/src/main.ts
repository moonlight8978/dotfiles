import * as core from '@actions/core'
import { number, string, object } from 'yup'
import { escape } from 'lodash'
import axios from 'axios'

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
    .filter(Boolean)
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
    token: string().required().trim()
  })

  const inputs = schema.cast({
    message: core.getInput('message'),
    columns: core.getInput('columns'),
    groupId: core.getInput('group'),
    token: core.getInput('token')
  })

  const message = [
    inputs.message,
    lineBreak,
    lineBreak,
    columnsToMessage(parseColumns(inputs.columns))
  ].join('')

  core.debug(message)

  try {
    await axios.post(
      `https://api.telegram.org/bot${inputs.token}/sendMessage`,
      {
        chat_id: inputs.groupId,
        text: message,
        parse_mode: 'HTML',
        disable_web_page_preview: true
      }
    )
  } catch (err: any) {
    core.error(err.message)
    if (err.response) {
      core.error(JSON.stringify(err.response.data))
    }
    core.setFailed(err.message)
  }
}
