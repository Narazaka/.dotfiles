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

let s:bundle_path = expand('~/.vim/bundle/')
let s:dein_toml = expand('~/.vimrc.d/dein.toml')
let s:dein_lazy_toml = expand('~/.vimrc.d/dein_lazy.toml')
if dein#load_state(s:bundle_path)
  call dein#begin(s:bundle_path, [$MYVIMRC, s:dein_toml, s:dein_lazy_toml])
  call dein#load_toml(s:dein_toml, {'lazy': 0})
  call dein#load_toml(s:dein_lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

runtime! ../.vimrc.d/plugins.d/*.vim
