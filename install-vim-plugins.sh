#!/bin/bash

apt-get install curl

mkdir -p ~/.vim/colors && cd ~/.vim/colors
wget -O pychimp.vim http://www.vim.org/scripts/download_script.php?src_id=17973

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle
git clone git://github.com/Lokaltog/vim-powerline.git

cd ~/.vim/bundle
git clone https://github.com/kien/ctrlp.vim.git

mkdir -p ~/.vim/ftplugin
wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
