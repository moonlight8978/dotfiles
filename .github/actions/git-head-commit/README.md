# discord-message

Action to post message to Discord

### Usage

```yml
jobs:
  notify:
    runs-on: ubuntu-latest
    steps:
      - uses: moonlight8978/dotfiles/.github/actions/discord-message@main
        with:
          message: Test discord message
          color: '50432'
          columns: |
            |W| inline |W| Project |W| [${{ github.repository }}](${{ github.event.repository.html_url }})
            |W| inline |W| Status |W| Succeed
            |W| inline |W| Author |W| ${{ github.triggering_actor || github.event.head_commit.author.username }}
            |W| full |W| Build |W| [${{ github.sha }}](${{ github.event.repository.html_url }}/actions/runs/${{ github.run_id }})
          webhook-url: ${{ secrets.DISCORD_WEBHOOK }}
```

### Development

```bash
npm install
npm run package
```
