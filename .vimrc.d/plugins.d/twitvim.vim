" TwitVim
let twitvim_enable_perl = 0
let twitvim_count = 50
let twitvim_browser_cmd = "open -a Sleipnir"
let twitvim_force_ssl = 1
" let twitvim_browser_cmd = "C:/Util/AnciaChrome/AnciaChrome.exe"
autocmd FileType twitvim call s:twitvim_my_settings()
function! s:twitvim_my_settings()
	nnoremap <buffer> f :<C-u>FriendsTwitter<CR>
	nnoremap <buffer> r :<C-u>RefreshTwitter<CR>
	nnoremap <buffer> R :<C-u>RepliesTwitter<CR>
	nnoremap <buffer> T <Leader>R
	nnoremap <buffer> U :<C-u>UserTwitter<CR>
	nnoremap <buffer> D :<C-u>DMTwitter<CR>
	nnoremap <buffer> d :<C-u>DMSentTwitter<CR>
	nnoremap <buffer> u :<C-u>BackTwitter<CR>
	nnoremap <buffer> <C-r> :<C-u>FowardTwitter<CR>
	nnoremap <buffer> <C-n> :<C-u>NextTwitter<CR>
	nnoremap <buffer> <C-p> :<C-u>PreviousTwitter<CR>
	nnoremap <buffer> i :<C-u>PosttoTwitter<CR>
	nnoremap <buffer> I :<C-u>SendDMTwitter<CR>
endfunction

