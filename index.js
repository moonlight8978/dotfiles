#!/usr/bin/env node
// const program = require('commander')

// program.version('0.1.0', '-v, --version').parse(process.argv)

// eslint-disable-next-line no-underscore-dangle
global.__basedir = __dirname

const path = require('path')

const shell = require('./src/shell')

const pathFromProject = relativePath => path.join(__dirname, relativePath)

const pathFromHome = relativePath => path.join(shell.env.HOME, relativePath)

// Install base packages
const basePackages = [
  'zsh',
  'tmux',
  'apt-transport-https',
  'ca-certificates',
  'curl',
  'wget',
  'gnupg-agent',
  'software-properties-common',
]
shell.update()
shell.upgrade()
shell.install(...basePackages)

// Install git
shell.exec('')
shell.update()
shell.install('git')
shell.ln('-s', pathFromProject('configs/.gitconfig'), pathFromHome('.gitconfig'))

// Install zsh and themes
if (shell.check('zsh')) {
  shell.exec(
    'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
  )
}

// Install theme
const zetaThemePath = pathFromHome('.oh-my-zsh/custom/themes/zeta.zsh-theme')
shell.rm('-f', zetaThemePath)
shell.ln('-s', pathFromProject('configs/zsh/themes/zeta.zsh-theme'), zetaThemePath)

// TODO: Setup theme and plugins
shell.source()

// Install nodejs
shell.exec('curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | $SHELL')
shell.source()
const latest = shell.exec('source ~/.nvm/nvm.sh && nvm ls-remote --lts | tail -n 1', {
  silent: true,
}).stdout
const version = latest.match(/v[|0-9|.]+/)[0]
shell.exec(`source ~/.nvm/nvm.sh && nvm install ${version} && nvm alias default ${version}`)

// Install yarn
if (!shell.check('yarn')) {
  shell.exec('curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -')
  shell.exec(
    'echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list'
  )
  shell.exec('sudo apt update && sudo apt install --no-install-recommends yarn')
  shell.exec('echo \'export PATH="$PATH:`yarn global bin`"\' > ~/.zshrc')
}
