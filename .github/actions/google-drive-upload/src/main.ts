import * as core from '@actions/core'
import * as google from '@googleapis/drive'
import { object, string } from 'yup'
import path from 'path'
import fs from 'fs'
import os from 'os'

export async function upload(
  remoteFolderId: string,
  localFilePath: string,
  destinationFilePath: string,
  serviceAccountBase64: string
) {
  const credentialsFilePath = path.join(
    os.tmpdir(),
    `${new Date().getTime()}.service-account.json`
  )

  fs.writeFileSync(
    credentialsFilePath,
    Buffer.from(serviceAccountBase64, 'base64')
  )

  const auth = new google.auth.GoogleAuth({
    keyFilename: credentialsFilePath,
    scopes: ['https://www.googleapis.com/auth/drive']
  })
  const authClient = await auth.getClient()

  const client = google.drive({
    version: 'v3',
    // @ts-expect-error Library error
    auth: authClient
  })

  const listFolderResponse = await client.files.list({
    q: `'${remoteFolderId}' in parents and mimeType = 'application/vnd.google-apps.folder'`,
    supportsAllDrives: true,
    includeTeamDriveItems: true
  })

  const destFileInfo = path.parse(destinationFilePath)
  const destFileName = destFileInfo.base
  const destDirName = destFileInfo.dir && path.parse(destFileInfo.dir).base

  const findOrCreateFolder = async (): Promise<string> => {
    // @ts-expect-error Missing type definition
    const folder = listFolderResponse.data.files?.find(
      (item: { name: string; id: string }) => item.name === destDirName
    )

    if (folder) {
      return folder.id
    }

    const res = await client.files.create({
      fields: 'id',
      supportsAllDrives: true,
      supportsTeamDrives: true,
      requestBody: {
        name: destDirName,
        parents: [remoteFolderId],
        mimeType: 'application/vnd.google-apps.folder'
      }
    })

    return res.data.id!
  }

  const destFolderId = await findOrCreateFolder()

  const fileSize = fs.statSync(localFilePath).size

  const uploadResponse = await client.files.create(
    {
      requestBody: {
        parents: [destFolderId],
        name: destFileName
      },
      media: {
        body: fs.createReadStream(localFilePath)
      },
      supportsAllDrives: true,
      supportsTeamDrives: true
    },
    {
      onUploadProgress: evt => {
        const progress = Math.round((evt.bytesRead / fileSize) * 100)
        if (progress % 5 === 0) {
          console.log(`${progress}% complete`)
        }
      }
    }
  )

  return {
    id: uploadResponse.data.id!,
    folderId: destFolderId,
    size: fileSize
  }
}

export async function run(): Promise<void> {
  const schema = object({
    serviceAccountBase64: string().required(),
    folder: string().required(),
    file: string().required(),
    destination: string().required()
  })

  const inputs = schema.cast({
    serviceAccountBase64: core.getInput('service-account-base64'),
    folder: core.getInput('folder'),
    file: core.getInput('file'),
    destination: core.getInput('destination')
  })

  const { id, folderId, size } = await upload(
    inputs.folder,
    inputs.file,
    inputs.destination,
    inputs.serviceAccountBase64
  )

  core.setOutput('file', id)
  core.setOutput('folder', folderId)
  core.setOutput('file-size', size)
  core.setOutput('file-url', `https://drive.google.com/file/d/${id}/view`)
}
