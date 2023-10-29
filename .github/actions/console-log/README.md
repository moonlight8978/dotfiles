# console-log

Log a message (single or multi-line) in Github Actions

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
