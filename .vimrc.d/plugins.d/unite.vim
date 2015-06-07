" Unite
let g:unite_enable_start_insert=1
nnoremap <F9> :Unite -vertical -winwidth=30 outline<CR>
" let g:unite_source_grep_command = 'vimgrep'
set grepprg=internal
" unite.vim上でのキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " 単語単位からパス単位で削除するように変更
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  " ESCキーを2回押すと終了する
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction

