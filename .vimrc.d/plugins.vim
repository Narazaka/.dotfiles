" ---------------------
" plugins
"
filetype plugin indent off

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let g:neobundle_default_git_protocol='https'

call neobundle#begin(expand('~/.vim/bundle/'))

"NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'sgur/unite-everything'
NeoBundle 'tacroe/unite-mark'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'sgur/unite-qf'
NeoBundle 'ujihisa/unite-gem'
NeoBundle 'kaorimatz/unite-cpan-module'
NeoBundle 'kana/vim-smartchr'
"NeoBundle 'kana/vim-smartinput'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kana/vim-textobj-user' " BASE
NeoBundle 'kana/vim-textobj-line' " al
NeoBundle 'kana/vim-textobj-indent' " ai(upper level) aI(same level)
NeoBundle "kana/vim-textobj-lastpat" " a/
NeoBundle 'kana/vim-textobj-underscore' " i_
NeoBundle 'RyanMcG/vim-textobj-dash' " i-
NeoBundle 'thinca/vim-textobj-between' " if.
NeoBundle 'thinca/vim-textobj-comment' " ic
NeoBundle 'gilligan/textobj-lastpaste' " ip
NeoBundle 'saihoooooooo/vim-textobj-space' " iS aS=include multibyte
NeoBundle 'vimtaku/vim-textobj-keyvalue' " ik iv
NeoBundle 'sgur/vim-textobj-parameter' " i,
" NeoBundle 'mattn/vim-textobj-url' " iu
NeoBundle 'rhysd/vim-textobj-lastinserted' " iu
NeoBundle 'rhysd/vim-textobj-ruby' " ir ruby block
NeoBundle 'h1mesuke/textobj-wiw' " ,w ,e i,w ...
NeoBundle 'deton/jasegment.vim' " W iW W E B
NeoBundle 'vim-scripts/vimtux'
NeoBundle 'wesleyche/SrcExpl'
NeoBundle 'wesleyche/Trinity'
NeoBundle 'vim-scripts/taglist.vim'
if has('lua')
	NeoBundle 'Shougo/neocomplete.vim'
else
	NeoBundle 'Shougo/neocomplcache.vim'
	NeoBundle 'Shougo/neocomplcache-clang'
endif
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'grep.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Yggdroot/indentLine'
NeoBundle "vimtaku/hl_matchit.vim"
NeoBundle 'c9s/perlomni.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'fugalh/desert.vim'

NeoBundle 'vim-scripts/ShowWhiteSpace'
NeoBundle 'Shougo/vim-nyaos'
NeoBundle 'othree/html5.vim'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'vim-scripts/css_color'
NeoBundle 'vim-scripts/tex-syntax'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'vim-perl/vim-perl'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'yuku-t/vim-ref-ri'
NeoBundle 'vim-scripts/ruby-matchit'
NeoBundle 'basyura/unite-rails'
"NeoBundle 'klen/python-mode'
NeoBundle 'othree/yajs.vim'

NeoBundle 'scrooloose/syntastic'

"NeoBundle 'vim-scripts/TwitVim'
NeoBundle 'basyura/TweetVim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'basyura/twibill.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'basyura/bitly.vim'

NeoBundle 'koron/chalice'

call neobundle#end()

filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
"NeoBundleCheck

" pathogen
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

runtime! ../.vimrc.d/plugins.d/*.vim

