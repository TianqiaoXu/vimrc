#!/bin/bash

cp .vimrc ~/.vimrc
source .vimrc
vim
  :PlugInstall
  :qa
