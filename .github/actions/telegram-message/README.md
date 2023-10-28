# telegram-message

### Usage

```yml
jobs:
  notify:
    runs-on: ubuntu-latest
    steps:
      - uses: moonlight8978/dotfiles/.github/actions/telegram-message@action/telegram-message
        with:
          message: ✅ PASSING  l  Development
          columns: |
            |W| full |W| Project |W| <a href="${{ github.event.repository.html_url }}">${{ github.repository }}</a>
            |W| full |W| Status |W| Succeed
            |W| full |W| Author |W| ${{ github.triggering_actor || github.event.head_commit.author.name || github.event.head_commit.author.username }}
            |W| full |W| Build |W| <a href="${{ github.event.repository.html_url }}/actions/runs/${{ github.run_id }}">${{ github.sha }}</a>
            |W| full |W| Changelog |W| ${{ github.event.head_commit.message }}
          token: ${{ secrets.TELEGRAM_TOKEN }}
          group: "-1"
```