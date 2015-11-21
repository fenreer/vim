#!/bin/bash

sudo bash -c 'echo "deb-src http://us.archive.ubuntu.com/ubuntu/ trusty main restricted universe multiverse" >> /etc/apt/sources.list'
sudo apt-get update
sudo apt-get build-dep --no-install-recommends vim
sudo apt-get install -y git
rm -rf vim
git clone https://github.com/vim/vim.git
cd vim/src
./configure --enable-pythoninterp --with-features=huge --prefix=$HOME/opt/vim
make && make install
mkdir -p $HOME/bin
cd $HOME/bin
ln -s $HOME/opt/vim/bin/vim
which vim
vim --version

sudo apt-get install -y gtk2-engines-pixbuf
