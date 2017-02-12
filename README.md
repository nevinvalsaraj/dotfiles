# Dotfiles

## Setting up Vim

### 1. Clone my dotfile repo to your machine
```bash
git clone https://github.com/nevinvalsaraj/dotfiles.git ~/dotfiles
```

### 2. Set up symlinks
```bash
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.vimrc ~/.vimrc
```

### 3. Clone Vundle
```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/vundle/Vundle.vim
```

### 4. Install Vundle plugins
Launch Vim and run `:PluginInstall`. Wait for it to complete.

### 5. Restart Vim
