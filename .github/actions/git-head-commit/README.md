# git-head-commit

Action to post message to Discord

### Usage

```yml
jobs:
  notify:
    runs-on: ubuntu-latest
    outputs:
      message: ${{ steps.git-head-commit.outputs.message }}
      author: ${{ steps.git-head-commit.outputs.author }}
      sha-short: ${{ steps.git-head-commit.outputs.sha-short }}
      sha: ${{ steps.git-head-commit.outputs.sha }}
      branch: ${{ steps.git-head-commit.outputs.branch }}
    steps:
      - uses: actions/checkout@v4
      - id: git-head-commit
        if: ${{ always() }}
        uses: moonlight8978/dotfiles/.github/actions/git-head-commit@main
```

### Development

```bash
npm install
npm run package
```
