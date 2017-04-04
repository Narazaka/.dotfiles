" ---------------------
" basic
set helplang=ja,en
" set helpfile=~/_vim/doc/help.txt
set nocompatible
" ---------------------
" display
set number
set ruler
set cmdheight=2
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set title
"set linespace=0
set wildmenu
set showcmd
set display+=lastline
" �����s��܂�Ԃ��ĕ\�� (nowrap:�܂�Ԃ��Ȃ�)
set wrap
" �^�u����s��\�� (list:�\��)
set list
set listchars=tab:^\ ,trail:~
" �J�[�\���s���n�C���C�g
set cursorline
highlight CursorLine gui=underline
" ---------------------
" syntax color
syntax on
" for GUI
" if has('gui_running')
colorscheme desert
" else
" colorscheme 
" endif
"" colorscheme darkblue
" colorscheme murphy
"" colorscheme pablo
" highlight LineNr ctermfg=yellow
" ---------------------
" search
set ignorecase " A=a
set smartcase " A!=a if A and a in str
set wrapscan " loop search
set hlsearch
" ---------------------
" edit
set autoindent
set cindent
" ���ʓ��͎��ɑΉ����銇�ʂ�\�� (noshowmatch:�\�����Ȃ�)
set showmatch
" �o�b�N�X�y�[�X�ŃC���f���g����s���폜�ł���悤�ɂ���
set backspace=indent,eol,start
set shiftwidth=2
set tabstop=2
"set noexpandtab
set expandtab
set clipboard=unnamed,unnamedplus
" set clipboard+=autoselect
" set guioptions+=a
" set paste
set pastetoggle=<F12>
" �e�L�X�g�}�����̎����܂�Ԃ�����{��ɑΉ�������
set formatoptions+=mM
" ---------------------
" backup
" set backup
" set backupdir=~/vim_backup
" ---------------------
" GUI view
if has('win32')
  set guifont=VL_�S�V�b�N:h9:cSHIFTJIS
end
" ---------------------
" filetypes
autocmd FileType c :compiler gcc
autocmd FileType cpp :compiler gcc
autocmd FileType perl,cgi :compiler perl
autocmd FileType perl,cgi map <F5> :w !perl<CR>
autocmd FileType cgi :set filetype=perl
autocmd FileType python :compiler python
autocmd FileType java :compiler javac
autocmd FileType qf :nnoremap Q :<C-u>Qfreplace
autocmd BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
autocmd BufRead,BufNewFile,BufReadPre *.jade set filetype=pug
autocmd BufRead,BufNewFile,BufReadPre *.pug set filetype=pug
autocmd BufRead,BufNewFile,BufReadPre *.styl set filetype=stylus
autocmd BufRead,BufNewFile,BufReadPre *.es6 set filetype=javascript
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
