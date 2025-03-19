curl https://raw.githubusercontent.com/Shougo/dein-installer.vim/master/installer.sh > dein_installer.sh
sh dein_installer.sh ~/.vim/bundle
rm dein_installer.sh
mkdir -p ~/.vim/bundle/repos/github.com
if [ -e ~/.vim/bundle/repos/github.com/Shougo/vimproc.vim ]; then
  cd ~/.vim/bundle/repos/github.com/Shougo/vimproc.vim
  git pull
  cd -
else
  git clone https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/repos/github.com/Shougo/vimproc.vim
fi
if [ "`echo $PATH | sed -n "/windows.*system32/p"`" = "" ] ; then
  vim -c "VimProcInstall" -c "call dein#install()" -c q
else
  echo run
  echo vim -c "VimProcInstall" -c "call dein#install()" -c q
fi
