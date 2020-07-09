import shell from "./libs/shell";

import {
  CommitId,
  BranchName,
  Commit,
  CommitMessage,
  RebaseOptions,
} from "./types";

export default class Git {
  constructor() {
    shell.checkPrerequisite("git");
  }

  squashCommits(depth: number): CommitId {
    const commits: Commit[] = this.getLastCommits(depth);
    const commitMessage = commits
      .map<CommitMessage>((commit) => commit.message)
      .join("\n\n");
    shell.exec(`git reset --soft HEAD~${depth}`);
    shell.exec("git add -A");
    shell.exec(`git commit -m "${commitMessage}"`);

    return shell.exec("git rev-parse HEAD");
  }

  rebaseSquash({ reset, squash, branch }: RebaseOptions): void {
    const commitToCherryPick = this.squashCommits(squash);

    const currentBranch = this.getCurrentBranchName();
    shell.exec(`git checkout ${branch}`);
    shell.exec(`git pull origin ${branch}`);

    shell.exec(`git checkout ${currentBranch}`);

    shell.exec(`git reset --hard HEAD~${reset}`);
    shell.exec(`git rebase ${branch}`);
    shell.exec(`git cherry-pick ${commitToCherryPick}`);
  }

  checkout({ branch }: { branch: BranchName }): void {
    try {
      shell.exec(`git branch -D ${branch}`);
    } catch {
    } finally {
      shell.exec(`git fetch origin ${branch}`);
      shell.exec(`git checkout ${branch}`);
    }
  }

  getCurrentBranchName(): BranchName {
    return shell.exec("git rev-parse --abbrev-ref HEAD");
  }

  getCommitInfo(commitId: CommitId): Commit {
    return {
      id: commitId,
      message: shell.exec(`git log -n 1 --format=%B ${commitId}`),
    };
  }

  getLastCommits(depth: number): Commit[] {
    const commitIds: CommitId[] = shell
      .exec(`git log -n ${depth} --format=%H`)
      .split("\n")
      .filter(Boolean)
      .reverse();

    return commitIds.map(this.getCommitInfo);
  }
}
