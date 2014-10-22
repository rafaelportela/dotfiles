#!/bin/bash

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

echo '+ Setting zsh as default shell'
chsh -s /bin/zsh

echo '+ Install selected vim plugins with: vim +PluginInstall +qall'
exec zsh
