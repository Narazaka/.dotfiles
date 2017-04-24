if has("job")
  let s:runner = "job"
else
  let s:runner = "vimproc"
endif

let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ =
      \ {
      \   "runner": s:runner,
      \   "outputter": "error",
      \   "outputter/error/success": "buffer",
      \   "outputter/error/error": "quickfix",
      \   "outputter/buffer/split": "rightbelow 8sp",
      \   "outputter/buffer/close_on_empty": 1,
      \ }
