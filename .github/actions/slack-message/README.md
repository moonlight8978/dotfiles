# slack-message

Action to post message to Slack

### Usage

```yml
jobs:
  notify:
    runs-on: ubuntu-latest
    steps:
      - uses: moonlight8978/dotfiles/.github/actions/slack-message@main
        with:
          message: Test slack message
          color: '50432'
          columns: |
            |W| inline |W| Project |W| [${{ github.repository }}](${{ github.event.repository.html_url }})
            |W| inline |W| Status |W| Succeed
            |W| inline |W| Author |W| ${{ github.triggering_actor || github.event.head_commit.author.username }}
            |W| full |W| Build |W| [${{ github.sha }}](${{ github.event.repository.html_url }}/actions/runs/${{ github.run_id }})
          webhook-url: ${{ secrets.SLACK_WEBHOOK }}
```

### Development

```bash
npm install
npm run package
```
