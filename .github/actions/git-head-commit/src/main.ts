import * as core from '@actions/core'
import * as exec from '@actions/exec'
import * as github from '@actions/github'
import {
  PushEvent,
  WorkflowDispatchEvent
} from '@octokit/webhooks-definitions/schema'

async function capture(
  command: string,
  args: string[],
  fallback: () => string = () => ''
): Promise<string> {
  try {
    const { exitCode, stdout } = await exec.getExecOutput(command, args)

    if (exitCode === 0) {
      return stdout.trim()
    }

    return (fallback() || '').trim()
  } catch (err) {
    return (fallback() || '').trim()
  }
}

export async function run(): Promise<void> {
  const payload = github.context.payload

  const type = core.getInput('type', { required: true }) as 'head' | 'smart'

  const sha = await capture(
    'git',
    ['rev-parse', 'HEAD'],
    () => github.context.sha
  )

  const shaShort = await capture('git', ['rev-parse', '--short', 'HEAD'], () =>
    sha.slice(0, 7)
  )

  const branch = await capture(
    'git',
    ['rev-parse', '--abbrev-ref', 'HEAD'],
    () => github.context.ref.replace(/^refs\/heads\//, '')
  )

  const author = await capture(
    'git',
    ['log', '-1', '--pretty=format:%an'],
    () => {
      const event = payload as PushEvent
      return (
        event.head_commit?.author.username ??
        event.head_commit?.author.name ??
        event.pusher.name ??
        event.pusher.username ??
        event.sender.name ??
        event.sender.login
      )
    }
  )

  const getLatestCommitMessage = async () => {
    return await capture(
      'git',
      ['log', '-1', '--pretty=format:%s%n%n%b'],
      () => {
        const event = payload as PushEvent
        return event.head_commit?.message ?? github.context.workflow
      }
    )
  }

  const getMessage = async () => {
    if (type === 'head') {
      return await getLatestCommitMessage()
    }

    const parentCommits = await capture('git', [
      'show',
      '--pretty=%ph',
      '--quiet',
      'HEAD'
    ]).then(output => output.split(' '))

    const isMergeCommit = parentCommits.length > 1

    if (!isMergeCommit) {
      return await getLatestCommitMessage()
    }

    const previousMergeCommit = parentCommits[0]
    const changelog = await capture('git', [
      'log',
      '--oneline',
      '--no-merges',
      '--pretty=format:"- %s"',
      `${previousMergeCommit}..HEAD`
    ])

    return changelog
  }

  const message = await getMessage()

  core.setOutput('sha-short', shaShort)
  core.setOutput('sha', sha)
  core.setOutput('branch', branch)
  core.setOutput('author', author)
  core.setOutput('message', message)
}
