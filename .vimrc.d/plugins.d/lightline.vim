let g:lightline = {
      \ 'active': {
      \   'left': [
      \     ['mode', 'paste'],
      \     ['readonly', 'fugitive', 'filename']
      \   ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightLineFilename',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified'
      \ }
      \}

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction
