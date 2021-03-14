# Dotfiles
My personal dotfiles repo and Node-powered bootstrapper.

## Setup
- Ensure [NodeJS](https://nodejs.org/en/) is installed (`node` and `npm` commands should be available globally).
- Clone the repo to your machine.
```sh
git clone https://github.com/nevinvalsaraj/dotfiles.git
```
- Download node dependencies for the bootstrapper.
```node
npm ci
```

## Installing Vim Configuration
- Install vim.
- Copy vim configuration files by running:
```node
npx grunt vim
```
- Launch vim (Ignore colorscheme load errors that appear).
- Inside vim, run:
```viml
:PlugInstall
```
to download `vimplug` dependencies.
- Restart vim.

## Installing neovim Configuration
- Install neovim.
- Copy neovim configuration files by running:
```node
npx grunt neovim
```
- Launch neovim (Ignore colorscheme load errors that appear).
- Inside neovim, run:
```viml
:PlugInstall
```
to download plugins.
- Restart neovim.

# Installing Zsh Configuration
- Install zsh.
- Copy zsh configuration files by running:
```node
npx grunt zsh
```
- Run zsh and wait for plugins to get downloaded and imported.

# Installing Emacs configuration
- Install emacs.
- Copy emacs configuration file by running:
```node
npx grunt emacs
```
- Run emacs and wait for plugins to get downloaded and imported.
