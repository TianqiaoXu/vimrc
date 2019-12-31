#!/bin/bash -v

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp .vimrc ~/.vimrc
source ~/.vimrc
vim
  :PlugInstall
  :qa