if [ -e ~/vim ] ; then
  cd ~/vim/src
  git pull
else
  git clone https://github.com/vim/vim.git ~/vim
  cd ~/vim/src
fi
./configure --prefix=$HOME/.usr --enable-luainterp=dynamic --enable-perlinterp=dynamic
make
make install
