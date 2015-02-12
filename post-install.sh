#! /usr/bin/env bash

chown -R vagrant:root /usr/local

# Post install
# ------------
echo "### Post-install"
# APT#{{{
# ---
echo "## APT"
# Configure#{{{
# ---------
echo "# Configure..."
cat > /etc/apt/sources.list <<EOF
deb http://ftp.fr.debian.org/debian/ wheezy main non-free contrib
deb-src http://ftp.fr.debian.org/debian/ wheezy main non-free contrib

deb http://security.debian.org/ wheezy/updates main contrib non-free
deb-src http://security.debian.org/ wheezy/updates main contrib non-free

# wheezy-updates, previously known as 'volatile'
deb http://ftp.fr.debian.org/debian/ wheezy-updates main contrib non-free
deb-src http://ftp.fr.debian.org/debian/ wheezy-updates main contrib non-free

# Opscode
# apt-get install opscode-keyring
deb http://apt.opscode.com/ wheezy-0.10 main

# Dotdeb
# wget http://www.dotdeb.org/dotdeb.gpg
# sudo apt-key add dotdeb.gpg
deb http://packages.dotdeb.org wheezy-php56 all
deb-src http://packages.dotdeb.org wheezy-php56 all

# Percona-server
#deb http://repo.percona.com/apt wheezy main
#deb-src http://repo.percona.com/apt wheezy main

# MariaDB
#apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
#deb http://nwps.ws/pub/mariadb/repo/10.0/debian wheezy main
#deb-src http://nwps.ws/pub/mariadb/repo/10.0/debian wheezy main

deb http://ftp.osuosl.org/pub/mariadb/repo/10.0/debian wheezy main
deb-src http://ftp.osuosl.org/pub/mariadb/repo/10.0/debian wheezy main

#deb http://download.nus.edu.sg/mirror/mariadb/repo/10.0/ubuntu trusty main
#deb-src http://download.nus.edu.sg/mirror/mariadb/repo/10.0/ubuntu trusty main
EOF
#}}}
# APT-Recommends#{{{
# --------------
cat > /etc/apt/apt.conf.d/10norecommends <<EOF
APT::Install-Recommends "0";
EOF
#}}}
# APT-Suggests#{{{
# ------------
cat > /etc/apt/apt.conf.d/10nosuggests <<EOF
APT::Install-Suggests "0";
EOF
#}}}
# APT-Keyring#{{{
# -----------
echo "# Install Apt keyring..."
apt-get install opscode-keyring
wget http://www.dotdeb.org/dotdeb.gpg
apt-key add dotdeb.gpg
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
#}}}
# APT-Update#{{{
# ----------
echo "# Update package list..."
aptitude update
#}}}
# APT-Upgrade#{{{
# -----------
echo "# Upgrade installed packages..."
aptitude -y safe-upgrade
#}}}
# APT-Install usefull packages#{{{
# ----------------------------
echo "# Install a few useful packages..."
aptitude -y install sudo screen inetutils-telnet ntpdate bsd-mailx logrotate multitail tcpdump nmap lsof ssmtp bind9-host atop htop iptraf psmisc less mlocate mtr python rsync unzip dnsutils whois cron-apt geoip-database  openssh-server file lockfile-progs openssh-blacklist openssh-blacklist-extra logwatch vim zsh
#}}}
#}}}
# Bash config#{{{
# -----------
echo "## Bash config"

VAGRANT_FILES="~/vagrant"

# For vagrant#{{{
# -----------
# Git clone#{{{
# -----------
echo "# For 'vagrant'"
git clone --depth 1 https://github.com/twolfson/sexy-bash-prompt.git /usr/local/src/bash/sexy-bash-prompt
ln -sfn /usr/local/src/bash/sexy-bash-prompt/.bash_prompt /home/vagrant/.bash_prompt

git clone git://github.com/trapd00r/LS_COLORS.git /usr/local/src/dircolors/LS_COLORS
ln -sfn /usr/local/src/dircolors/dircolors-solarized/dircolors.ansi-light /home/vagrant/.dircolors

git clone git://git.kernel.org/pub/scm/git/git.git /usr/local/src/git/git
git clone git://github.com/rupa/z.git /usr/local/src/z
git clone https://github.com/billinux/vagrant.git ${VAGRANT_FILES:- ~/vagrant}

rm -f ~/.bashrc
ln -sfn $VAGRANT_FILES/resources/.bashrc ~/.bashrc
ln -sfn $VAGRANT_FILES/resources/.bash_aliases ~/.bash_aliases
ln -sfn $VAGRANT_FILES/resources/.vimrc ~/.vimrc
ln -sfn $VAGRANT_FILES/resources/.gitconfig ~/.gitconfig
ln -sfn $VAGRANT_FILES/resources/.huslogin ~/.huslogin

#git clone https://github.com/ruby/ruby.git /usr/local/src/ruby/ruby
git clone git://github.com/rubygems/rubygems.git /usr/local/src/ruby/rubygems
git clone git://github.com/badger/curl.git /usr/local/src/curl
git clone https://github.com/github/hub.git /usr/local/src/git/hub

git clone https://github.com/golang/go.git /usr/local/src/go
ln -sfn /usr/local/src/go /usr/local/go

git clone https://github.com/joyent/node.git /usr/local/src/node

# ex: ln -sfn /usr/local/src/ruby/ruby/2.2.0 ~/.rbenv/versions/2.2.0

#}}}
# Rbenv#{{{
# -----
git clone https://github.com/sstephenson/rbenv.git /home/vagrant/.rbenv
exec /home/vagrant/.rbenv/bin/rbenv init
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
exec /home/vagrant/.rbenv/plugins/ruby-build/install.sh
chmod +x /home/vagrant/.rbenv/completions/rbenv.bash && ~/.rbenv/completions/rbenv.bash
#}}}
#}}}
# For root#{{{
# --------
echo "# For 'root'"
sudo rm -f /root/.bashrc
sudo ln -sfn /home/vagrant/.bashrc /root/.bashrc
sudo ln -sfn /home/vagrant/.bash_aliases /root/.bash_aliases
sudo ln -sfn /home/vagrant/.vimrc /root/.vimrc
sudo ln -sfn /home/vagrant/.rbenv /root/.rbenv
sudo ln -sfn /usr/local/src/bash/sexy-bash-prompt/.bash_prompt /root/.bash_prompt
ln -sfn /usr/local/src/dircolors/dircolors-solarized/dircolors.ansi-light /root/.dircolors
ln -sfn /home/vagrant/.gitconfig /root/.gitconfig
ln -sfn /home/vagrant/.huslogin /root/.huslogin
#}}}

#}}}

# Zsh
# ---
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
chsh -s /bin/zsh

chown -R vagrant:vagrant /home/vagrant

source /home/vagrant/.bashrc
source /root/.bashrc

echo "## DONE"
