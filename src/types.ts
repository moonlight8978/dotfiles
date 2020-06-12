export type CommitId = string;

export type CommitMessage = string;

export interface Commit {
  id: CommitId;
  message: CommitMessage;
}

export type BranchName = string;

export interface RebaseOptions {
  reset: number;
  squash: number;
  branch: string;
}
