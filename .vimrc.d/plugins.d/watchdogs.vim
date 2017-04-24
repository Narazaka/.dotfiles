let g:quickrun_config = get(g:, 'quickrun_config', {})

" ファイルタイプごとのデフォルトでは無いチェッカー設定
let g:quickrun_config["javascript/watchdogs_checker"] =
      \ {
      \   "type": "watchdogs_checker/eslint",
      \ }
let g:quickrun_config["ruby/watchdogs_checker"] =
      \ {
      \   "type": "watchdogs_checker/rubocop",
      \ }

" 保存時自動チェック
let g:watchdogs_check_BufWritePost_enable = 1
" 無効設定
" "php": 0, みたいにする
" let g:watchdogs_check_BufWritePost_enables =
"       \ {
"       \ }

" 一定時間キー入力がなかった場合自動チェック
let g:watchdogs_check_CursorHold_enable = 1
" 無効設定
" "php": 0, みたいにする
" let g:watchdogs_check_CursorHold_enables =
"       \ {
"       \ }

let g:quickrun_config["watchdogs_checker/_"] =
      \ {
      \   "runner/vimproc/updatetime" : 20,
      \ }

call watchdogs#setup(g:quickrun_config)
