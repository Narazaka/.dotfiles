" ---------------------
" plugins
"
filetype plugin indent off
syntax off

if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim/
endif

let g:vimproc#download_windows_dll = 1

" kaoriya同梱のvimprocを無効化する
if has('kaoriya')
  let &rtp = join(filter(split(&rtp, ','), 'v:val !~ "[/\\\\]plugins[/\\\\]vimproc$"'), ',')
endif

call dein#begin(expand('~/.vim/bundle/'))
call dein#load_toml(expand('~/.vimrc.d/dein.toml'), {'lazy': 0})
call dein#load_toml(expand('~/.vimrc.d/dein_lazy.toml'), {'lazy': 1})
call dein#end()

filetype plugin indent on
syntax enable

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
"NeoBundleCheck

" pathogen
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

runtime! ../.vimrc.d/plugins.d/*.vim
