su -
sudo visudo -f /etc/sudoers.d/vagrant
su
sudo apt-get -y update
sudo apt-get -y install openssh-server
mkdir ~/.ssh
cd .ssh/
su
sudo groupadd admin
sudo usermod -G admin vagrant
sudo apt-get -y vim git-core
sudo apt-get -y install  git-core
sudo apt-get -y install vim
sudo update-alternatives --config editor
vi
sudo hostname vagrant
su
sudo -i
ll
echo "export PATH=$PATH:/usr/sbin:/sbin" >> .bashrc 
sb
echo $PATH
vb
sb
path
c
ll
cp .bashrc .bash_profile
vi .bash_profile 
cp .bash_profile .bash_aliases
vi .bashrc 
vi .bashrc
vi .bash_profile 
ll
cat .bashrc >> .bash_profile 
vi .bash_profile 
vi .bashrc
mv .bash_aliases .aliases
vi .aliases 
source .bash_profile 
ll
la
lk
c
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
vb
vi .aliases 
source .bashrc 
ll
vb
cd
alias 
vi .aliases 
source .bashrc 
source .bash_profile 
vb
vi .bash_profile 
sb
ll
vi .aliases 
exit
cd
ls -l
ls -la
mkdir local bin
cd local/
hg clone https://vim.googlecode.com/hg/ vim
cd vim/
ls
hg pull
hg update
cd src/
make
sudo apt-get install ncurses
sudo apt-get build-dep vim
sudo apt-cache search ncurses-dev
sudo apt-get install libncurses5-dev
cd ..
ls
export LDFLAGS=-L/usr/lib
./configure --with-features=huge --enable-perlinterp --enable-cscope --with-python --enable-rubyinterp
./configure --with-features=huge --enable-perlinterp --enable-cscope --with-python-config-dir=/usr/lib/python2.7/config --enable-rubyinterp
sudo make && make install
./configure --with-features=huge --enable-cscope --with-python-config-dir=/usr/lib/python2.7/config 
make
sudo make && make install
sudo make
sudo make install
vim
sudo -i
cd ..
ls
git clone https://github.com/git/git.git
ll
ls
cd git/
make configure
sudo apt-get install autoconf
clear
make configure
./configure --prefix=/usr/
make all
sudo make install
which git
/usr/bin/git =v
/usr/bin/git -v
/usr/bin/git --version
sudo -i
/usr/bin/git --version
ls
ls git£
ls git*
./git --version
mv ./git /usr/local/bin/
sudo mv ./git /usr/local/bin/
git --version
ls git-*
cd ..
ls
mv git/ git.old
git clone git://git.kernel.org/pub/scm/git/git.git
ls
sudo mv git vim /usr/local/src/
ls
cd
cd /usr/local/src/
ls
wget http://curl.haxx.se/download/curl-7.40.0.tar.gz
sudo wget http://curl.haxx.se/download/curl-7.40.0.tar.gz
ls
sudo -i
ls
sudo chown -R $USER /usr/local/
ll
ls
ls =l
ls -l
rm =rf curl-7.40.0/
rm -rf curl-7.40.0/
alias ll='ls -l'
ll
git clone git://github.com/badger/curl.git
git clone git://github.com/bagder/curl.git
ll
cd
vi .bashrc 
history | grep editor
sudo update-alternatives --config editor
vim
ll
vim .bashrc 
source .bashrc 
ll
vim .bashrc 
sb
ll
rmf local/
ll
git --version
vi
sudo -i
ll
vi .bashrc 
sb
ll
alias 
la
sudo -i
sudo pwd
chmod 0700 /home/vagrant/.ssh/
wget --no-check-certificate https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys 
chown -R vagrant /home/vagrant/.ssh/
sudo vi /etc/ssh/sshd_config 
sudo vim /etc/ssh/sshd_config 
/etc/init.d/ssh restart
sudo service ssh restart
sudo ifconfig 
echo $PATH
su - vagrant
exit
ll
vi .bashrc 
vim .bashrc 
source .bashrc 
cd .rbenv/bin/
ll
ls
cd
rm -f .bashrc 
mv .bash_profile .bashrc
source .bashrc 
ll
vi .bashrc 
vim .bashrc 
mv .aliases .bash_aliases
source .bashrc 
ll
path
vi .bashrc 
source .bashrc 
ll
path
type rbenv
cd .rbenv/
git pull
git fetch
git tag
cd
h
hl
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
ll
cd
cd .rbenv/plugins/
ll
cd ruby-build/
ll
./install.sh 
ll
./install.sh 
cd
rbenv install -l
rbenv install
rbenv install -l | less
rbenv install 2.2.0
sudo rbenv install 2.2.0
rbenv install 2.2.0
cd .rbenv/plugins/ruby-build/
ll
sh install.sh 
ruby-build 
ruby-build ~/local/ruby-2.2.0
ruby-build 2.2.0 ~/local/ruby-2.2.0
rbenv install -l | less
rbenv install 2.1.5
exit
ll
rbenv install 2.2.0
sudo -i
cd
rbenv install 2.2.0
ruby -v
ruby -version
cd
cd .rbenv/versions/
ll
cd
rbenv version
rbenv rehash 
rbenv version
cd /usr/local/src/
ll
git clone https://github.com/joyent/node.git
ll
cd node/
ll
./configure 
make
sudo make install
node -v
git tag
npm -v
node
npm install forever -g
sudo npm install forever -g
ll
cd
ll
cd /var/
ll
cd
ll
mkdir -p dev/www/test
cd dev/www/
ll
cd test/
mkdir nodejs
cd nodejs/
vi ~/.vimrc
pushd ~
ll
la
mkdir .cache/vim/undo
mkdir -p .cache/vim/undo
popd 
vi ~/.vimrc
ll
vi serverTest.js
vi ~/.vimrc
vi serverTest.js
ll
node
ll
node serverTest.js 
vi serverTest.js
node serverTest.js 
ll
vi serverTest.js
ll
sudo npm install -g grunt grunt-cli
sudo npm install -g gulp
sudo npm install -g bower
c
sudo npm install -g yo
sudo npm install -g yeoman
c
sudo npm install -g yo
cd /usr/local/src/node/
ll
git tag
git checkout v0.10.36
git branch
./configure 
make
sudo make install
node -v
sudo npm install -g yo
cd
cd dev/www/test/
ll
cd nodejs/
ll
rmf npm-debug.log 
ll
vi serverTest.js 
node serverTest.js 
ll
cd
sudo npm install -g generator-webapp
cd /usr/local/src/
ll
git clone git://github.com/rupa/z.git
ll
cd z/
ll
vi /home/vagrant/.bashrc 
ll
vi /home/vagrant/.bashrc 
sb
ll
cd
cd dev/www/test/
ll
cd
z /home/vagrant/dev/www/test/
ll
sudo npm install -g generator-angular
cd /usr/local/src/
ll
git clone git://github.com/rubygems/rubygems.git
ll
cd rubygems/
sudo ruby setup.rb 
ruby --version
cd
cd .rbenv/versions/
ll
rbenv rehash 
rbenv version
rbenv versions
cd ..
ll
rbenv version
rbenv versions
ll
la
cd plugins/
ll
h
h | grep ruby
h | grep 2.2.0
rbenv global 2.2.0
ruby
ruby -v
cd /usr/local/src/
ll
cd rubygems/
ll
sudo ruby setup.rb 
ruby setup.rb 
gem update --system
sudo gem install sass compass
gem install sass compass
cd
sudo npm install -g cordova
sudo npm install -g ionic
ll
npm list -g
sudo npm list -g --depth=0
sudo npm install -g grunt-phpcs
sudo npm install -g claymate
sudo npm install -g grunt-init
cd /etc/apt/sources.list.d/
ll
sudo vi dotdeb.list
sudo vim dotdeb.list
cd
sudo -i
sudo apt-get update
sudo apt-cache search php5
sudo apt-cache policy php5
sudo vim /etc/apt/sources.list.d/dotdeb.list 
sudo apt-get update
sudo apt-cache policy php5
sudo vim /etc/apt/sources.list.d/dotdeb.list 
sudo apt-get update
sudo apt-cache policy php5
sudo apt-get php-cli
sudo apt-get install php-cli
sudo apt-cache policy php5-cli
sudo apt-get install php5-cli
sudo apt-get install php-pear
pear list
pear install PHP_CodeSniffer
sudo pear install PHP_CodeSniffer
phpcs help
sudo apt-get install zerofree
cd
cd .ssh/
ll
vi authorized_keys 
ll
sudo -i
cll
ll
sudo service ssh restart
ll
vi authorized_keys 
q
ll
chmod 644 authorized_keys 
ll
sudo shutdown -h now
ll
lk
la
rmf ..vimrc.un~ 
ll
la
vi .bashrc 
ll
c
vi .bashrc 
vi .vimrc 
vi .bashrc 
ll
which vim
type vim
vi .bashrc 
sb
type vim
vi .bashrc 
sb
vi .bashrc 
sb
echo $EDITOR
vi .bashrc 
path
sb
path
vi .bashrc 
sb
path
exit
path
vi /etc/profile
ll
vi .bashrc 
exit
path
vi /etc/profile
vi /etc/bash.bashrc 
path
vi .bashrc 
sb
path
vi .bashrc 
cp .bash_aliases .aliases
sb
ll
mv .aliases .shell_aliases
sb
ll
source .bashrc 
ll
mv .bash_aliases .bash_aliases.bak
sb
ll
exit
ll
ll .shell_aliases 
vb
vi .bashrc 
vim .bashrc 
source .bashrc 
ll
exit
ll
vim .bashrc 
mv .bash_aliases.bak .bash_aliases
rm .shell_aliases 
ll
source .bashrc 
ll
vb
vim .bashrc 
vim .bash_aliases 
vi .vimrc 
source .bashrc 
vb
sudo apt-get install most
sudo apt-cache search completion
sudo apt-get install bash-completion
vb
man ls
sb
man ls
vb
man date
vb
cd
cd /usr/local/src/
ll
git clone https://github.com/magicmonty/bash-git-prompt.git
ll
cd
ln -sfn /usr/local/src/bash-git-prompt/ ~/.bash-git-prompt
lk
cd .bash-git-prompt
ll
cd
vb
sb
ll
cd /usr/local/src/git/
ll
cd
vb
sb
ll
pushd /usr/local/src/vim/
s
cd git/
s
cd
vb
sudo -i
cd /usr/local/src/
ll
git clone --recursive https://github.com/sorin-ionescu/prezto.git zprezto
ll
cd
ln -sfn /usr/local/src/zprezto/ ~/.zprezto
ll
vi .bash_aliases 
sb
lk
ls =la
la
lk
ls -lah
ls -lah|grep ->
ls -lah|grep "->"
ls -lah|grep "\->"
vi .bash_aliases 
sb
lh
source .bashrc 
lh
source .bash_aliases 
lh
lk
lli
ln -s ~/.zprezto/runcoms/zlogin ~/.zlogin
ln -s ~/.zprezto/runcoms/zlogout ~/.zlogout
ln -s ~/.zprezto/runcoms/zpreztorc ~/.zpreztorc
ln -s ~/.zprezto/runcoms/zprofile ~/.zprofile
ln -s ~/.zprezto/runcoms/zshenv ~/.zshenv
ln -s ~/.zprezto/runcoms/zshrc ~/.zshrc
zsh
vi .zpreztorc 
ll
exit
zsh
lk
ll
ls =la
ls -la
vi .bash_aliases 
vi .aliases 
ls =a
ls -a
vim .bash_aliases 
ll
vim .bashrc 
sb
source .bashrc 
ll
lk
vb
sb
zsh
exit
zsh
vb
c
vi .zshrc 
c
lk
cd .zprezto
ll
source init.zsh 
cd
zsh --version
ll
lk
zsh
ll
mv .zprezto .zprezto.link
ll
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
ll
zsh
lk
vi .zshrc 
ll
c
vi .zprofile 
ll
ll .zsh*
ll
cd .zprezto
ll
s
ll
s
ll
cd vagrant/
ll
lk
c
vi .vimrc 
ll
vb
sb
cd /usr/local/src/git/
ll
ls
echo $TERM
vb
sb
s
cd bash-git-prompt/
ll
cd themes/
ll
cd
vb
sb
vb
sb
source .bashrc 
vb
sb
source .bashrc 
echo $green
echo $green bill
vb
source .bashrc 
echo $bo
echo $green $bo
echo \[\033[1,36m\]bill
echo \033[1,36mbill
echo \033[1;36mbill
echo \[\033[1;36m\]bill
echo \[\033[1;36m\] bill
vb
sb
vb
sb
vb
sb
vb
sb
source .bashrc 
vb
sb
vb
sb
vb
sb
vb
sb
source .bashrc 
vb
exit
ll
echo $PS1
vb
sb
vb
sb
c
vb
sb
ll
lk
la
vb
sb
vb
sb
vb
sb
ll
tput setaf 1
tput setaf 2
tput setaf 172
vb
vi .bash_aliases 
sb
ll
lk
vb
sb
vb
sb
set
setenv
ENV
setenv
vb
sb
printenv 
vb
sb
printenv SHELL
printenv TERM
printenv green
vb
sb
ll
vb
sb
vb
sb
ll
vi .vimrc 
vb
ll
lk
lh
la
vb
vi .vimrc
ll
cd .cache/
la
cd vim/
ll
cd undo/
ll
cd
ll
vi .vimrc
cd .cache/
la
cd .vim/
la
cd
s
ll
cd vagrant/
cd .cache/
ll
rmf vim/
ll
la
cd
vi .vimrc
cd .cache/.vim/
ll
la
cd
vi .vimrc
cd .cache/.vim/
la
vi .vimrc
cd
vi .vimrc
cd .cache/.vim/
ll
la
cd
vi .vimrc
cd .cache/.vim/.cache/undo/
ll
la
cd
ll
vi .vimrc
cd .cache/.vim/neobundle/base16-vim/
ll
cd colors/
ll
vi ~/.vimrc
vb
sb
vb
vi ~/.vimrc
exit
ll
vi
vb
sb
vb
sb
vb
sb
vb
sb
ll
vb
sb
vb
sb
exit
ll
vb
sb
exit
vb
sb
source .bashrc 
lk
ll
la
vb
sb
vb
sb
ll
vb
sb
exit
ll
z /usr/local/src
ll
cd curl/
ll
ifconfig 
s
ll
git clone --depth 1 https://github.com/twolfson/sexy-bash-prompt
ll
cd sexy-bash-prompt/
ll
make install
cd
source .bashrc 
ll
vb
sb
ll
cd
la
vb
ll
mv .bash_prompt .bash_prompt.bak
ll
sb
ll
cd /usr/local/src/sexy-bash-prompt/
ll
cd
vb
ll
sb
vb
ln -sfn /usr/local/src/sexy-bash-prompt/.bash_prompt ~/.bash_prompt
sb
ll
c
ll
cd /usr/local/src/
cd sexy-bash-prompt/
cd
exit
cd /usr/local/src/
ll
cd sexy-bash-prompt/
s
ll
cd bash-git-prompt/
s
cd node/
git checkout master
s
cd vim/
ll
s
ll
cd git/
ll
vb
ll
cd
ll
cd dev/
ll
cd www/
ll
cd test/
ll
s
ll
cd
ll
mkdir tmp
ll
cd tmp/
ll
wget https://raw.githubusercontent.com/twolfson/sexy-bash-prompt/master/README.md
ll
cd
vi .vimrc tmp/README.md 
ll
vi .bashrc tmp/README.md 
sb
z /usr/local/src
ll
cd git/
ll
s
ll
cd git/
s
ll
cd
vi .bashrc tmp/README.md 
ll
sb
ll
cd dev/
ll
cd cd
cd tmp
s
cd tmp/
ll
rmf README.md 
ll
mkd gitest
cd
rmf .bash_prompt.bak 
ll
vi .bash_aliases 
sb
cd tmp/
mkd gitest
ll
git init
cd
vb
sb
cd tmp/gitest/
cd
vb
sb
cd tmp/gitest/
ll
touch test.{txt,c,sh,php,vim,sql,lua,py,doc,xls}
ll
cd
vb
sb
cd tmp/gitest/
ll
cd
vb
sb
cd tmp/gitest/
ll
cd
cd tmp/gitest/
vb
sb
ll
tput staf 5
vb
sb
ll
git add test.c
git commit -m "commit test.c"
z /usr/local/src
ll
git clone https://github.com/trap00r/LS_COLORS.git
git clone https://github.com/trapOOr/LS_COLORS.git
ll
git clone https://github.com/trap00r/LS_COLORS.git
h
vi /home/vagrant/.bash_aliases 
sb
hgrep clone
git clone git://github.com/trapd00r/LS_COLORS.git
ll
cd LS_COLORS/
ll
vb
vi /home/vagrant/.bash_aliases 
vb
cd
la
ln -sfn /usr/local/src/LS_COLORS/LS_COLORS ~/.dircolors
vb
sb
ll
vb
sb
vb
sb
ll
la
cd /usr/share/terminfo/
ll
cd x/
ll
z /usr/
z /usr/local/src
ll
git clone git://github.com/seebi/dircolors-solarized.git
cd dircolors-solarized/
ll
cd
ln -sfn /usr/local/src/dircolors-solarized/dircolors.ansi-dark ~/.dircolors
sb
ll
cd tmp/gitest/.git/
s
ll
pushd ~
ln -sfn /usr/local/src/dircolors-solarized/dircolors.ansi-light ~/.dircolors
sb
ll
ln -sfn /usr/local/src/dircolors-solarized/dircolors.ansi-universal ~/.dircolors
sb
ll
popd 
ll
cd
ln -sfn /usr/local/src/dircolors-solarized/dircolors.ansi-dark ~/.dircolors
sb
ll
la
ln -sfn /usr/local/src/dircolors-solarized/dircolors.ansi-light ~/.dircolors
ll
sb
ll
lk
la
cd tmp/gitest/.git/
s
ll
z /usr/local/src
ll
mkdir dircolors
ll
mv LS_COLORS/ dircolors-solarized/ dircolors
ll
mkdir bash-prompt
mv sexy-bash-prompt/ bash-git-prompt/ bash-prompt/
ll
mkdir zsh-prompt
mv zprezto/ zsh-prompt/
ll
cd
lk
ln -sfn /usr/local/src/bash-prompt/bash-git-prompt/ ~/.bash-git-prompt 
ln -sfn /usr/local/src/bash-prompt/sexy-bash-prompt/.bash_prompt ~/.bash_prompt 
ln -sfn /usr/local/src/dircolors/dircolors-solarized/dircolors.ansi-light ~/.dircolors 
ll
rmf .zprezto
mv .zprezto.link .zprezto
ln -sfn /usr/local/src/zsh-prompt/zprezto/ ~/.zprezto
ll
sb
ll
z /usr/local/src
ll
cd dircolors/dircolors-solarized/
ll
git branch -a
git checkout -b customize
ll
vi dircolors.ansi-light 
l
ll
sb
ll
vi dircolors.ansi-light 
sb
ll
vi dircolors.ansi-light 
sb
ll
pushd ~/
ll
popd 
vi dircolors.ansi-light 
sb
pushd ~/
ll
popd 
vi dircolors.ansi-light 
sb
pushd ~/
ll
cd /
ll
cd /var/cache/apt/
ll
cd archives/
ll
sudo apt-get clean
ll
cd
df
sudo -i
ll
z /usr/local/src
ll
mkd test
ll
s
ll
rmf test/
ll
cd bash-prompt/
ll
cd
chmod 700 .ssh/
chmod 600 .ssh/authorized_keys 
chown -R vagrant:vagrant .ssh/
sudo -i
ll
sudo find /usr/share/locale/* -maxdepth 1 -type d ! -name "fr*" ! -name "en*" -exec rm -rf {} \;
cd /usr/share/locale/
ll
cd /usr/src/
ll
cd
ll
mv dev/ code
ll
cd code/
ll
mkdir personal
ll
mkdir others
ll
mv www/ personal/
ll
cd others/
ll
mkdir github.com
ll
z /usr/
cd local/src/
ll
git clone https://github.com/github/hub.git
ll
cd hub/
ll
script/build 
s
ll
git clone https://github.com/golang/go.git
ll
s
ll
ln -s src/go/ ./go
ll
vb
ll
sb
ll
vb
echo $TERM
vb
sb
ll
vb
sb
ll
cd src/
ll
cd hub/
script/build 
exit
z /usr/
cd local/src/
cd hub/
s
cd go/
ll
git tag
ll
cd src/
ll
sudo ./all.bash 
sudo -i
ll
./all.bash 
sudo ./all.bash 
./make.bash 
s
cd src/go/
ll
cd src/
sudo ./make.bash 
ll
ls
sudo ./all.bash 
git tag | less
git checkout go1.4
ll
sudo ./all.bash 
ll
ls
go --version
ls
sudo ./all.bash > go.txt
vi go.txt 
rmf go.txt 
ll
sudo apt-cache search golang
sudo apt-cache policy golang
sudo apt-get install golang
s
ll
s
ll
cd hub/
ll
script/build 
sudo script/build 
ll
cd script/
ll
su
go version
ll
su
hgrep golang
hgrep install
sudo apt-get remove golang --purge
sudo apt-get autoremove 
ll
sudo shutdown -h now
z /usr/
cd local/src/
cd hub/
s
cd go/
ll
git tag
ll
cd src/
ll
sudo ./all.bash 
sudo -i
ll
./all.bash 
sudo ./all.bash 
./make.bash 
s
cd src/go/
ll
cd src/
sudo ./make.bash 
ll
ls
sudo ./all.bash 
git tag | less
git checkout go1.4
ll
sudo ./all.bash 
ll
ls
go --version
ls
sudo ./all.bash > go.txt
vi go.txt 
rmf go.txt 
ll
sudo apt-cache search golang
sudo apt-cache policy golang
sudo apt-get install golang
s
ll
s
ll
cd hub/
ll
script/build 
sudo script/build 
ll
cd script/
ll
su
go version
ll
su
hgrep golang
hgrep install
sudo apt-get remove golang --purge
sudo apt-get autoremove 
ll
sudo shutdown -h now
z /usr/
cd local/src/
cd hub/
s
cd go/
ll
git tag
ll
cd src/
ll
sudo ./all.bash 
sudo -i
ll
./all.bash 
sudo ./all.bash 
./make.bash 
s
cd src/go/
ll
cd src/
sudo ./make.bash 
ll
ls
sudo ./all.bash 
git tag | less
git checkout go1.4
ll
sudo ./all.bash 
ll
ls
go --version
ls
sudo ./all.bash > go.txt
vi go.txt 
rmf go.txt 
ll
sudo apt-cache search golang
sudo apt-cache policy golang
sudo apt-get install golang
s
ll
s
ll
cd hub/
ll
script/build 
sudo script/build 
ll
cd script/
ll
su
go version
ll
su
hgrep golang
hgrep install
sudo apt-get remove golang --purge
sudo apt-get autoremove 
ll
sudo shutdown -h now
ll
sudo apt-get update
sudo apt-get install nginx
sudo service nginx start
ifconfig eth0 | grep inet | awk '{ print $2 }'
curl 'http://localhost:80'
netstat -tnlp
lsmod | grep vbox
sudo shutdown -h now
ll
sudo apt-get update
sudo apt-get install nginx
sudo service nginx start
ifconfig eth0 | grep inet | awk '{ print $2 }'
curl 'http://localhost:80'
netstat -tnlp
lsmod | grep vbox
sudo shutdown -h now
ll
sudo shutdown -h now
ll
sudo shutdown -h now
dmesg 
dmesg | less
ll
sudo shutdown -h now
dmesg 
dmesg | less
ll
sudo shutdown -h now
ll
sudo shutdown -r now
ll
sudo shutdown -r now
sudo shutdown -h now
sudo shutdown -h now
ll
sudo reboot
ll
sudo reboot
sudo vim /etc/default/grub 
sudo update-grub
sudo reboot
sudo vim /etc/default/grub 
sudo update-grub
sudo reboot
sudo vim /etc/default/grub 
sudo update-grub
sudo reboot
sudo vim /etc/default/grub 
sudo update-grub
sudo reboot
sudo shutdown -h now
sudo shutdown -h now
ifconfig 
ifconfig -a
sudo vi /etc/network/interfaces 
sudo vim /etc/network/interfaces 
ifconfig -a
ifconfig -a|less
sudo vim /etc/network/interfaces 
cd /etc/network/
ll
sudo cp interfaces interfaces.old
sudo vim /etc/network/interfaces 
sudo service networking restart 
sudo ifconfig -a
sudo shutdown -r now
ifconfig 
ifconfig -a
sudo vi /etc/network/interfaces 
sudo vim /etc/network/interfaces 
ifconfig -a
ifconfig -a|less
sudo vim /etc/network/interfaces 
cd /etc/network/
ll
sudo cp interfaces interfaces.old
sudo vim /etc/network/interfaces 
sudo service networking restart 
sudo ifconfig -a
sudo shutdown -r now
ifconfig 
ifconfig -a
sudo vi /etc/network/interfaces 
sudo vim /etc/network/interfaces 
ifconfig -a
ifconfig -a|less
sudo vim /etc/network/interfaces 
cd /etc/network/
ll
sudo cp interfaces interfaces.old
sudo vim /etc/network/interfaces 
sudo service networking restart 
sudo ifconfig -a
sudo shutdown -r now
dmesg 
ping -c4 192.168.0.1
ping -c4 google.com
sudo ifconfig -a | less
sudo vim /etc/network/interfaces 
sudo service networking restart 
ping -c4 192.168.0.1
sudo shutdown -r now
dmesg 
ping -c4 192.168.0.1
ping -c4 google.com
sudo ifconfig -a | less
sudo vim /etc/network/interfaces 
sudo service networking restart 
ping -c4 192.168.0.1
sudo shutdown -r now
ping -c4 192.168.0.1
sudo ifdown eth0
ping -c4 192.168.0.1
sudo ifup eth1
ping -c4 192.168.0.1
sudo vim /etc/network/interfaces 
sudo service networking restart 
sudo ifconfig -a | less
sudo shutdown -r now
ping -c4 192.168.0.1
sudo ifdown eth0
ping -c4 192.168.0.1
sudo ifup eth1
ping -c4 192.168.0.1
sudo vim /etc/network/interfaces 
sudo service networking restart 
sudo ifconfig -a | less
sudo shutdown -r now
sudo ifconfig -a | less
cd /etc/network/
ll
sudo mv interfaces interfaces.test
sudo mv interfaces.old interfaces
ll
sudo shutdown -h now
sudo ifconfig -a | less
cd /etc/network/
ll
sudo mv interfaces interfaces.test
sudo mv interfaces.old interfaces
ll
sudo shutdown -h now
sudo ifconfig -a | less
cd /etc/network/
ll
sudo mv interfaces interfaces.test
sudo mv interfaces.old interfaces
ll
sudo shutdown -h now
cd .ssh/
ll
sudo shutdown -h now
cd .ssh/
ll
sudo shutdown -h now
cd .ssh/
ll
cd
rm -rf .ssh/
ll
la
ll
ssh-add -l
sudo apt-get remove openssh-server openssh-client
sudo apt-get autoremove
sudo shutdown -r now
cd .ssh/
ll
cd
rm -rf .ssh/
ll
la
ll
ssh-add -l
sudo apt-get remove openssh-server openssh-client
sudo apt-get autoremove
sudo shutdown -r now
ll
exit
ll
mkd ~/.ssh
ll
chmod 700 ~/.ssh/
ll
s
ll
la
lk
la
vi .vimrc 
ll
ll .ssh/
ll .ss*
ll
curl 'http://localhost'
ll
cd .ssh/
ll
cat authorized_keys 
ll
exit
cd /etc/ssh/
ll
s
rmf ./ssh/
sudo rmf ./ssh/
sudo rm -rf ./ssh/
ll
sudo apt-get install openssh-server openssh-client
sudo service ssh restart
z /usr/
cd local/src/
ll
s
ll
cd go/
ll
cd src/
ll
ls
sudo ./all.bash 
cd /usr/share/
ll
cd doc
ll
c
ls
man ls
ll
sudo apt-get clean 
du -sh /
sudo du -sh /
ll
sudo shutdown -h now
ll
sudo shutdown -h now
ll
curl 'http://localhost'
sudo ifconfig -a | grep eth
sudo ifconfig -a | grep addr
sudo ifconfig -a | less
cd /etc/network/
ll
mv interfaces interfaces.old
sudo mv interfaces interfaces.old
sudo vi interfaces
ll
sudo cp interfaces.test interfaces
sudo vi interfaces
sudo vim interfaces
sudo service networking restart 
sudo ifconfig -a | less
sudo shutdown -h now
ll
sudo ifconfig -a | less
ping -c4 192.168.56.101
sudo vim /etc/network/interfaces
sudo iptables -L
sudo shutdown -r now
ll
ping -c4 192.168.56.101
ifconfig 
exit
sudo apt-cache search hub
sudo apt-get install hub
sudo shutdown -h now
ll
ifconfig 
curl 'http://192.168.56.101'
curl 'http://10.0.2.15'
sudo route
sudo service iptabbles stop
sudo apt-cache search mariadb
sudo apt-cache search percona
cd /etc/apt/
cd sources.list.d/
ll
ca dotdeb.list >> ../sources.list
sudo cat dotdeb.list >> ../sources.list
sudo -i
ll
s
sudo vim sources.list
cd sources.list.d/
ll
vi percona-server.list
sudo vi percona-server.list
sudo vim percona-server.list
q
sudo -i
ll
sudo vim percona-server.list
ll
sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A
sudo vim /etc/apt/preferences.d/00percona.pref
sudo apt-get update
sudo apt-cache search percona
sudo apt-cache search percona-server
sudo apt-get install php5-curl php5-xmlrpc php5-gd php5-intl  php5 php5-common php5-dev php5-idn php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-mysql php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy
sudo apt-get install php5-curl php5-xmlrpc php5-gd php5 php5-common php5-dev php5-idn php-pear php5-imagick php5-imap php5-mcrypt php5-memcache  php5-mysql php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy
cd /usr/share/nginx/www/
ll
sudo vim info.php
sudo service nginx restart
sudo apt-get remove
sudo apt-get remove nginx
sudo apt-get install apache2
cd /usr/share/nginx/
ll
cd www/
ll
sudo cp info.php /var/www/
sudo apt-get install libapache2-mod-php5
sudo apt-get autoremove
sudo service apache2 restart
sudo update-rc.d apache2 enable
sudo service apache2 restart
curl 'http://localhost'
curl 'http://localhost/info.php'
sudo shutdown -r now
sudo lsb_release -a
cd /etc/apt/sources.list.d/
ll
sudo vim mariadb.list
ll
sudo apt-get install python-software-properties
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
sudo add-apt-repository 'deb http://nwps.ws/pub/mariadb/repo/10.0/debian wheezy main'
sudo apt-get update
sudo apt-get install mariadb-server
ll
s
ll
vi sources.list
sudo vim sources.list
ll
cd sources.list.d/
ll
sudo -i
curl 'http://localhost/info.php'
curl 'http://localhost/'
cd /var/www/
ll
php -i
telnet yonitg.com 80
ll
telnet localhost 80
ifconfig 
su
exit
h
h > provision.sh
