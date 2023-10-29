# google-drive-prune

### Usage

```yml
jobs:
  job:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: moonlight8978/dotfiles/.github/actions/google-drive-prune@main
        with:
          service-account-base64: ${{ secrets.SERVICE_ACCOUNT_BASE64 }}
          keep: 2
          folder: google-drive-folder-id
          github-token: ${{ secrets.GITHUB_TOKEN }}
          workflow: ${{ github.workflow }}
```

- `folder`: Take the id from folder URL. eg:
  `https://drive.google.com/drive/folders/<folder-id>`

- `destination`: Current limit to single depth folder. eg: `a/b/c/Test.yml`,
  `a/b` will be stripped

- `service-account-base64`:
  ```bash
  cat service-account.json | base64 -w 0
  ```
