curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh
sh dein_installer.sh ~/.vim/bundle
mkdir -p ~/.vim/bundle/repos/github.com
git clone https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/repos/github.com/Shougo/vimproc.vim
if [ "`echo $PATH | sed -n "/windows.*system32/p"`" = "" ] ; then
  vim -c "VimProcInstall" -c "call dein#install()" -c q
else
  echo run
  echo vim -c "VimProcInstall" -c "call dein#install()" -c q
fi
