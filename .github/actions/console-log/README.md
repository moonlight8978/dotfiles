# git-head-commit

Action to post message to Discord

### Usage

```yml
jobs:
  notify:
    runs-on: ubuntu-latest
    steps:
      - uses: moonlight8978/dotfiles/.github/actions/console-log@main
        with:
          message: some long message
```

### Development

```bash
npm install
npm run package
```
