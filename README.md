# dotfiles

My personal dotfiles

## Installation

- Install Determinate Nix

- Switch to nix profile

  - Debian
  ```bash
  just nix
  ```

  - MacOS
  ```bash
  just nix-darwin
  ```

- Run setup playbook

  ```bash
  ansible-playbooks -i inventory main.yml --tag <debian|mac>
  ```
