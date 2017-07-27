" ---------------------
" keymap
" set bioskey
" set timeout
" set timeoutlen=500
" ---------------------
" split
set hidden
nnoremap ss s
nnoremap s <Nop>
nnoremap sp :<C-u>new<CR>
nnoremap sv :<C-u>vne<CR>
nnoremap sbp :<C-u>sp<CR>
nnoremap sbv :<C-u>vs<CR>
nnoremap sc :<C-u>close<CR>
nnoremap sw <C-w>w
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap s<LEFT> <C-w>h
nnoremap s<DOWN> <C-w>j
nnoremap s<UP> <C-w>k
nnoremap s<RIGHT> <C-w>l
" ---------------------
" tab
nnoremap g<UP> :<C-u>tabnew<CR>
nnoremap g<DOWN> :<C-u>tabclose<CR>
nnoremap g<LEFT> :gt
nnoremap g<RIGHT> :gT
nnoremap tt t
nnoremap t <Nop>
" nnoremap tn :<C-u>tabnew<CR>:tabmove<CR>:Unite -buffer-name=file file<CR>
nnoremap tn :<C-u>tabnew<CR>:tabmove<CR>
nnoremap tc :<C-u>tabclose<CR>
nnoremap tl :<C-u>tabn<CR>
nnoremap th  :<C-u>tabp<CR>
nnoremap t<RIGHT> :<C-u>tabn<CR>
nnoremap t<LEFT>  :<C-u>tabp<CR>
noremap <C-RIGHT> :<C-u>tabn<CR>
noremap <C-LEFT> :<C-u>tabp<CR>
inoremap <C-RIGHT> <Esc>:<C-u>tabn<CR>
inoremap <C-LEFT> <Esc>:<C-u>tabp<CR>
nnoremap tL :<C-u>call Tabswap_next()<CR>
nnoremap tH :<C-u>call Tabswap_prev()<CR>
noremap <M-C-RIGHT> :<C-u>call Tabswap_next()<CR>
noremap <M-C-LEFT> :<C-u>call Tabswap_prev()<CR>
function! Tabswap_next()
	let l:cur = tabpagenr()
	tabnext
	let l:next = tabpagenr()
	tabprevious
	exe 'tabmove' (l:next - 1)
	if l:next == 1
		tabnext
		exe 'tabmove' l:cur
		tabnext
	endif
endfunction
function! Tabswap_prev()
	let l:cur = tabpagenr()
	tabprevious
	let l:prev = tabpagenr()
	tabnext
	exe 'tabmove' (l:prev - 1)
	if l:cur == 1
		tabprevious
		exe 'tabmove' 0
		tabprevious
	endif
endfunction
" ---------------------
" text-edit
" noremap <CR> i<CR><ESC>
"カーソルを表示行で移動する。物理行移動は<C-n>,<C-p>
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
" insert Enter
nnoremap <C-CR> i<CR><Esc>
" ---------------------
" encoding shortcut
nnoremap ;u :<C-u>e ++enc=utf8<CR>
nnoremap ;s :<C-u>e ++enc=sjis<CR>
nnoremap ;j :<C-u>e ++enc=iso-2022-jp<CR>
nnoremap ;e :<C-u>e ++enc=euc-jp<CR>
nnoremap ;d :<C-u>set ff=dos<CR>
nnoremap ;x :<C-u>set ff=unix<CR>
nnoremap ;m :<C-u>set ff=mac<CR>
" ---------------------
" unite
nnoremap Uf :<C-u>Unite -buffer-name=file file<CR>
nnoremap UF :<C-u>UniteWithBufferDir -buffer-name=file file<CR>
nnoremap Up :<C-u>Unite ref/perldoc<CR>
nnoremap Um :<C-u>Unite file_mru<CR>
nnoremap Ub :<C-u>Unite buffer<CR>
nnoremap Uy :<C-u>Unite -buffer-name=register register<CR>
nnoremap Urm :<C-u>Unite rails/model<CR>
nnoremap Urv :<C-u>Unite rails/view<CR>
nnoremap Urc :<C-u>Unite rails/controller<CR>
nnoremap Ur. :<C-u>Unite rails/config<CR>
nnoremap Urr :<C-u>Unite rails/route<CR>
nnoremap Urt :<C-u>Unite rails/spec<CR>
nnoremap Ura :<C-u>Unite rails/asset<CR>
nnoremap Urh :<C-u>Unite rails/helper<CR>
nnoremap Ugt :<C-u>Unite giti<CR>
nnoremap Ugb :<C-u>Unite giti/branch<CR>
nnoremap Ugs :<C-u>Unite giti/status<CR>
nnoremap Ugl :<C-u>Unite giti/log<CR>
nnoremap Ugr :<C-u>Unite giti/remote<CR>
nnoremap Ugc :<C-u>Unite giti/config<CR>
nnoremap Ugg :<C-u>Unite giti/grep<CR>
" FZF
" ---------------------
nnoremap UU :<C-u>FZF<CR>
" ---------------------
" quickfix
autocmd FileType qf nnoremap <silent><buffer>q :quit<CR>
autocmd FileType qf :nnoremap Q :<C-u>Qfreplace
" ---------------------
" shortcut
nnoremap Xd :<C-u>vertical diffsplit 
map <F7> :make<CR>
nnoremap TT :<C-u>FriendsTwitter<CR>
" nnoremap <ESC><ESC> <C-u>:nohlsearch<CR>
" ---------------------
 " brackets"
" inoremap {} {}<LEFT>
" inoremap [] []<LEFT>
" inoremap () ()<LEFT>
" inoremap "" ""<LEFT>
" inoremap '' ''<LEFT>
" inoremap <> <><LEFT>

