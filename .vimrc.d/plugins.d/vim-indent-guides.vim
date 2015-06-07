let g:indent_guides_enable_on_vim_startup = 1
if !has('gui_running')
  let g:indent_guides_auto_colors = 0
  autocmd VimEnter,ColorScheme * highlight IndentGuidesOdd ctermbg=black
  autocmd VimEnter,ColorScheme * highlight IndentGuidesEven ctermbg=blue
end
