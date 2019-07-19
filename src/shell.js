const shell = require('shelljs')

const exec = (command, options = {}) => shell.exec(command, { shell: '/usr/bin/zsh', ...options })

module.exports = {
  ...shell,
  exec,
  check: command => exec(`command -v ${command}`).code === 127,
  install: (...packages) => exec(`sudo apt install -y ${packages.join(' ')}`),
  update: () => exec('sudo apt update -qq'),
  upgrade: () => exec('sudo apt upgrade -y'),
  addRepository: repo => exec(`sudo add-apt-repository -y ${repo}`),
  removeRepository: repo => exec(`sudo add-apt-repository -y -r ${repo}`),
  source: (file = '~/.zshrc') => exec(`source ${file}`),
}
