import * as core from '@actions/core'
import axios from 'axios'
import { number, string, object } from 'yup'

const lineBreak = `&#10;`

type Column = {
  title: string
  content: string
  placement: string
}

function parseColumns(columns: string) {
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
          currentColumn.content = columnContentSchema
            .cast(column)
            .replace(/[\r\n]/gm, lineBreak)
          break
      }

      return acc
    }, [] as Column[])
}

export async function run(): Promise<void> {
  const schema = object({
    message: string().required().trim(),
    columns: string().required().trim()
  })

  const inputs = schema.cast({
    message: core.getInput('message'),
    columns: core.getInput('columns')
  })

  const list = parseColumns(inputs.columns).map(column =>
    column.placement === 'full'
      ? `▪️ <b>${column.title}</b>${lineBreak}${column.content}`
      : `▪️ <b>${column.title}</b>: ${column.content}`
  )

  core.setOutput(
    'message',
    [inputs.message, lineBreak, lineBreak, list.join(lineBreak)].join('')
  )
}
