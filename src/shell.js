const shell = require('shelljs')

module.exports = {
  ...shell,
  exec: (command, options = {}) => shell.exec(command, { shell: '/usr/bin/zsh', ...options }),
  check: command => this.exec(`command -v ${command}`).code === 127,
  install: (...packages) => this.exec(`sudo apt install -y ${packages.join(' ')}`),
  update: () => this.exec('sudo apt update -qq'),
  upgrade: () => this.exec('sudo apt upgrade -y'),
  addRepository: repo => this.exec(`sudo add-apt-repository -y ${repo}`),
  removeRepository: repo => this.exec(`sudo add-apt-repository -y -r ${repo}`),
  source: (file = '~/.zshrc') => this.exec(`source ${file}`),
}
