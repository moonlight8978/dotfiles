import * as core from '@actions/core'

export async function run(): Promise<void> {
  console.log(core.getInput('message') as string)
}
