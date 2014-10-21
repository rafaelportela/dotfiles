#!/bin/bash

echo 'Cloning on-my-zsh'
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
chsh -s /bin/zsh
exec zsh

if [ -e ~/.zshrc ]; then
  rm ~/.zshrc
fi
echo 'Sym-linking ~/.zshrc to ~/.dotfiles/zshrc'
ln -s ~/.dotfiles/zshrc ~/.zshrc 

source ~/.zshrc

if [ -e ~/.vim ]; then
  rm ~/.vim
fi
echo 'Sym-linking ~/.vim to ~/.dotfiles/vim'
ln -s ~/.dotfiles/vim ~/.vim

if [ -e ~/.vimrc ]; then
  rm ~/.vimrc
fi
echo 'Sym-linking ~/.vimrc to ~/.dotfiles/vimrc'
ln -s ~/.dotfiles/vimrc ~/.vimrc
