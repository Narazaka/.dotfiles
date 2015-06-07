" VimFiler上でのキーマッピング
autocmd FileType vimfiler call s:vimfiler_my_settings()
function! s:vimfiler_my_settings()
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction

