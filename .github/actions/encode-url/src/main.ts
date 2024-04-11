import * as core from '@actions/core'
import { object, string, boolean } from 'yup'
import queryString from 'query-string'

export async function run(): Promise<void> {
  try {
    const { value, action } = object({
      value: string().required().trim(),
      action: string().required().trim().oneOf(['encode', 'decode'])
    }).cast({
      value: core.getInput('value'),
      action: core.getInput('action')
    })

    const url = new URL(value)

    switch (action) {
      case 'encode': {
        const qs = queryString.parse(url.search, {
          decode: false
        })
        url.search = queryString.stringify(qs, { encode: true })
        break
      }

      case 'decode':
      default: {
        const qs = queryString.parse(url.search, {
          decode: true
        })
        url.search = queryString.stringify(qs, { encode: false })
        break
      }
    }

    core.setOutput('value', url.toString())
  } catch (error: any) {
    core.error(error.message)
    core.setFailed(error.message)
  }
}
