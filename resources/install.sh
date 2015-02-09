#! /usr/bin/env bash

# Pre-requisites
# --------------
suso -s

# Keyring
# -------
apt-get install opscode-keyring
wget http://www.dotdeb.org/dotdeb.gpg
sudo apt-key add dotdeb.gpg
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
curl -sL https://deb.nodesource.com/setup | bash -
cp sources.list /etc/apt/


# Apt update && Apt-upgrade
# -------------------------
apt-get update && apt-get upgrade

# First install
# -------------
apt-get install curl

# Git
# ---
apt-get install git
sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev build-essential
git clone git://git.kernel.org/pub/scm/git/git.git /usr/local/src/git/git
cd /usr/local/src/git/git
make prefix=/usr/local all
sudo make prefix=/usr/local/ install

apt-get install mercurial

# Change /usr/local permissions
# -----------------------------
chown -R vagrant:root /usr/local/

# Vim
# ---
# https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
hg clone https://vim.googlecode.com/hg/ /usr/local/src/vim

sudo apt-get install checkinstall

# Libs for server
sudo apt-get install libncurses5-dev  python-dev

# Libs for gui
#sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
#    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
#    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
#    ruby-dev mercurial

sudo apt-get remove vim vim-runtime gvim
sudo apt-get remove vim-tiny vim-common vim-gui-common

cd /usr/local/src/vim

hg pull
hg update

# Config for server
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config \
            #--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/
            --enable-perlinterp \
            --enable-luainterp \
            --enable-cscope --prefix=/usr
            #--enable-gui=gtk2 --enable-cscope --prefix=/usr
            #--enable-gui=gnome2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim74
sudo make install
#sudo checkinstall

sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim

# Compiling YouCompleteMe
sudo apt-get install build-essential cmake

cd ~/.vim/.cache/.vim/neobundle/YouCompleteMe
# With semantic support for C-family languages
./install.sh --clang-completer
# Without semantic support for C-family languages
#./install.sh

# -
git clone git://github.com/rupa/z.git /usr/local/src/z
source /usr/local/src/z/z.sh

# Dotfiles
# --------
git clone https://github.com/billinux/vagrant.git ~/.dotfiles

# Sexy-bash-prompt
# ----------------
git clone --depth 1 https://github.com/twolfson/sexy-bash-prompt.git /usr/local/src/bash/sexy-bash-prompt
ln -sfn /usr/local/src/bash/sexy-bash-prompt/.bash_prompt ~/.bash_prompt

# Dircolors
# ---------
git clone git://github.com/trapd00r/LS_COLORS.git /usr/local/src/dircolors/LS_COLORS
ln -sfn /usr/local/src/dircolors/dircolors-solarized/dircolors.ansi-light ~/.dircolors

git clone git://github.com/seebi/dircolors-solarized.git /usr/local/src/dircolors/dircolors-solarized
ln -sfn /usr/local/src/dircolors/dircolors-solarized/dircolors.ansi-light ~/.dircolors

# Rbenv
# -----
git clone https://github.com/sstephenson/rbenv.git /home/vagrant/.rbenv
~/.rbenv/bin/rbenv init
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
cd .rbenv/plugins/ruby-build/
sudo ./install.sh
chmod +x ~/.rbenv/completions/rbenv.bash && ~/.rbenv/completions/rbenv.bash


# Ruby
# ----
#git clone https://github.com/ruby/ruby.git /usr/local/src/ruby/ruby
#cd /usr/local/src/ruby/ruby
#./configure
# Edit 'defines.h' if you need
# Remove '#' before 'ext/setup' if you need
# Usually you don't needed
# make distclean if needed
# make && sudo make install
# You can symlinked this version in ~/.rbenv/versions
# ex: ln -sfn /usr/local/src/ruby/ruby/2.2.0 ~/.rbenv/versions/2.2.0

#rbenv install 2.2.0
rbenv install 2.1.5
rbenv global 2.1.5
rbenv rehash

# Rubygems
# --------
git clone git://github.com/rubygems/rubygems.git /usr/local/src/ruby/rubygems
cd /usr/local/src/ruby/rubygems
sudo -s
ruby setup.rb

git clone git://github.com/badger/curl.git /usr/local/src/curl
git clone https://github.com/github/hub.git /usr/local/src/git/hub
git clone https://github.com/golang/go.git /usr/local/src/go
ln -sfn /usr/local/src/go /usr/local/go

# LAMP
# ====
apt-get update

# Apache2
apt-get install apache2

# MariaDB
# -------
apt-get install mariadb-server

# MongoDB
# -------
sudo -s
apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list
apt-get install mongodb-10gen

# Config MongoDB
# http://www.sky-future.net/2014/07/installer-mongodb-debian/

# Php
# ---
apt-get install php5 libapache2-mod-php5 php5-mcrypt
apt-get install php5-curl php5-xmlrpc php5-gd php5-intl  php5 php5-common php5-dev php5-idn php-pear php5-imagick php5-imap php5-mcrypt php5-memcache  php5-mysql php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy

# PhpmyAdmin
# ----------
apt-get install phpmyadmin

# Node
# ----
#apt-get install -y nodejs
git clone https://github.com/joyent/node.git /usr/local/src/node
cd /usr/local/src/node
git tag
git checkout v0.12.0
./configure && make && sudo make install

# Npm modules (globales)
# ----------------------
sudo npm -g install forever grunt grunt-cli gulp bower yo generator-webapp generator-angular cordova ionic grunt-phpcs grunt-init

# Zsh
# ---
sudo apt-get install zsh
zsh
# Zprezto
# -------
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
cd ~/.zprezto
git pull && git submodule update --init --recursive
source ~/.zpreztorc
sudo chsh -s /bin/zsh
chmod +x ~/.rbenv/completions/rbenv.zsh && ~/.rbenv/completions/rbenv.zsh

apt-get install php5-curl php5-xmlrpc php5-gd php5-intl  php5 php5-common php5-dev php5-idn php-pear php5-imagick php5-imap php5-mcrypt php5-memcache  php5-mysql php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy
