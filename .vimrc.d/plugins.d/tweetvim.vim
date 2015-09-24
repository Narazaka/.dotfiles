"1 ページあたりのツイート取得件数
let g:tweetvim_tweet_per_page = 50
"表示内容をキャッシュしておく数(バッファを戻る、進むに使用)
"let g:tweetvim_cache_size     = 10
"設定情報を保存するディレクトリ
"let g:tweetvim_config_dir     = expand('~/.tweetvim')
"タイムラインにリツイートを含める
let g:tweetvim_include_rts    = 1
"source(クライアント名) を表示するオプション
let g:tweetvim_display_source = 1
"ツイート時間の表示・非表示設定 (少しでも表示時間を速くしたい場合)
let g:tweetvim_display_time   = 1
"タイムラインを開く際のコマンドを指定 (edit/split/vsplit)
let g:tweetvim_open_buffer_cmd = 'edit!'
"発言用のバッファを開く際のコマンドを指定
let g:tweetvim_open_say_cmd = 'botright split'
"アイコン表示 (ImageMagick が必要)
let g:tweetvim_display_icon = 1
"tweetvim_say バッファを開いた際にフッタ(メッセージ)を表示する
let g:tweetvim_footer = ''
"tweetvim_say バッファにアカウント名を差し込む
"let g:tweetvim_say_insert_account = 0
"セパレータの表示/非表示
let g:tweetvim_display_separator = 1
"空文字セパレータを表示
let g:tweetvim_empty_separator = 0
"g:tweetvim_display_separator と排他的に動作
