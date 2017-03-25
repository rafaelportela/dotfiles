#!/bin/bash

echo '+ Setting up Git configurations'
if [ -e ~/.gitconfig ]; then
  rm -rf ~/.gitconfig
fi
ln -s ~/.dotfiles/gitconfig ~/.gitconfig

if [ -e ~/.git-templates ]; then
  rm -rf ~/.git-templates
fi
ln -s ~/.dotfiles/git-templates ~/.git-templates

echo '+ Installing vundle'
if [ -e ~/.vim ]; then
  rm -rf ~/.vim
fi
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim --depth 1

echo '+ Setting up ~/.vimrc'
if [ -e ~/.vimrc ]; then
  rm ~/.vimrc
fi
ln -s ~/.dotfiles/vimrc ~/.vimrc
mkdir ~/.vim
ln -s ~/.dotfiles/vim-colors ~/.vim/colors

echo '+ Installing on-my-zsh'
if [ -e ~/.oh-my-zsh ]; then
  rm -rf ~/.oh-my-zsh
fi
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh --depth 1

echo '+ Setting up ~/.zshrc'
if [ -e ~/.zshrc ]; then
  rm -rf ~/.zshrc
fi
ln -s ~/.dotfiles/zshrc ~/.zshrc

echo '+ Setting up ~/.tmux.conf'
if [ -e ~/.tmux.conf ]; then
  rm -rf ~/.tmux.conf
fi
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf

echo '+ Setting zsh as default shell'
chsh -s /bin/zsh

echo '+ Install selected vim plugins with: vim +PluginInstall +qall'
exec zsh
