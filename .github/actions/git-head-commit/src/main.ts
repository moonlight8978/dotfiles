import * as core from '@actions/core'
import * as exec from '@actions/exec'

export async function run(): Promise<void> {
  const { stdout: shaShort } = await exec.getExecOutput('git', [
    'rev-parse',
    '--short',
    'HEAD'
  ])
  const { stdout: sha } = await exec.getExecOutput('git', ['rev-parse', 'HEAD'])
  const { stdout: branch } = await exec.getExecOutput('git', [
    'rev-parse',
    '--abbrev-ref',
    'HEAD'
  ])
  const { stdout: author } = await exec.getExecOutput('git', [
    'log',
    '-1',
    '--pretty=format:%an'
  ])
  const { stdout: message } = await exec.getExecOutput('git', [
    'log',
    '-1',
    '--pretty=format:%s%b'
  ])

  core.setOutput('sha-short', shaShort.trim())
  core.setOutput('sha', sha.trim())
  core.setOutput('branch', branch.trim())
  core.setOutput('author', author.trim())
  core.setOutput('message', message.trim())
}
