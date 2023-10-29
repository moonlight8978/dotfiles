# google-drive-upload

![coverage](badges/coverage.svg)

### Usage

```yml
jobs:
  job:
    runs-on: ubuntu-latest
    steps:
      - id: upload-artifacts
        uses: moonlight8978/dotfiles/.github/actions/google-drive-upload@main
        with:
          service-account-base64: ${{ secrets.SERVICE_ACCOUNT_BASE64 }}
          folder: google-drive-folder-id
          file: Test.csv
          destination: ${{ github.run_id }}/Test.csv
      - moonlight8978/dotfiles/.github/actions/console-log@main
        with:
          message: |
            file: ${{ steps.upload-artifacts.outputs.file }}
            folder: ${{ steps.upload-artifacts.outputs.folder }}
            file-size: ${{ steps.upload-artifacts.outputs.file-size }}
            file-url: ${{ steps.upload-artifacts.outputs.file-url }}
```

- `folder`: Take the id from folder URL. eg:
  `https://drive.google.com/drive/folders/<folder-id>`

- `destination`: Current limit to single depth folder. eg: `a/b/c/Test.yml`,
  `a/b` will be stripped

- `service-account-base64`:
  ```bash
  cat service-account.json | base64 -w 0
  ```
