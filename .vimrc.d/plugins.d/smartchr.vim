" smartchr
"inoremap <expr> , smartchr#one_of(', ', ',')
"autocmd FileType c,cpp inoremap <buffer> <expr> . smartchr#loop('.', '->', '...')

"autocmd FileType ruby call s:smartchr_ruby()
function! s:smartchr_ruby()
	inoremap <expr> < search('^#include\%#', 'bcn')? ' <': smartchr#one_of(' < ', ' << ', '<')
	inoremap <expr> > smartchr#one_of(' > ', '>')
	inoremap <expr> + smartchr#one_of(' + ', '++', '+')
	inoremap <expr> - smartchr#one_of(' - ', '--', '-')
	inoremap <expr> / smartchr#one_of(' / ', ' // ', '/')
	inoremap <expr> * smartchr#one_of(' * ', ' ** ', '*')
	inoremap <expr> & smartchr#one_of(' & ', ' && ', '&')
	inoremap <expr> % smartchr#one_of(' % ', '%')
	inoremap <expr> <Bar> smartchr#one_of(' <Bar> ', ' <Bar><Bar> ', '<Bar>')
	inoremap <expr> ? smartchr#one_of(' ? ', '?')
	inoremap <expr> : smartchr#one_of(':', ': ',  ': :', '::')
	" =の場合、単純な代入や比較演算子として入力する場合は前後にスペースをいれる。
	" 複合演算代入としての入力の場合は、直前のスペースを削除して=を入力
	inoremap <expr> = search('\(&\<bar><bar>\<bar>+\<bar>-\<bar>/\<bar>>\<bar><\) \%#', 'bcn')? '<bs>= '
					\ : search('\(*\<bar>!\)\%#', 'bcn') ? '= '
					\ : smartchr#one_of(' = ', ' == ', '=')
  inoremap <expr> . smartchr#one_of('.', ' .. ', ' ... ', '...')
endfunction
"autocmd FileType eruby
"      \ inoremap <buffer> <expr> > smartchr#loop('>', '%>')
"      \| inoremap <buffer> <expr> < smartchr#loop('<', '<%', '<%=')
"autocmd FileType perl call s:smartchr_perl()
function! s:smartchr_perl()
	" 演算子の間に空白を入れる
	inoremap <expr> < search('^#include\%#', 'bcn')? ' <': smartchr#one_of(' < ', ' <<', '<')
	inoremap <expr> > search('\(=\<bar>-\) \%#', 'bcn')? '<bs>> ': smartchr#one_of(' > ', '->', '>')
	inoremap <expr> + smartchr#one_of(' + ', '++', '+')
	inoremap <expr> - smartchr#one_of(' - ', '--', '-')
	inoremap <expr> / smartchr#one_of(' / ', ' // ', '/')
	inoremap <expr> * smartchr#one_of(' * ', ' ** ', '*')
	" *はポインタで使うので、空白はいれない
	inoremap <expr> & smartchr#one_of(' & ', ' && ', '&')
	inoremap <expr> % smartchr#one_of(' % ', '%')
	inoremap <expr> <Bar> smartchr#one_of(' <Bar> ', ' <Bar><Bar> ', '<Bar>')
	inoremap <expr> ? smartchr#one_of(' ? ', '?')
	inoremap <expr> : smartchr#one_of(' : ', '::', ':')
	" =の場合、単純な代入や比較演算子として入力する場合は前後にスペースをいれる。
	" 複合演算代入としての入力の場合は、直前のスペースを削除して=を入力
	inoremap <expr> = search('\(&\<bar><bar>\<bar>+\<bar>-\<bar>/\<bar>>\<bar><\) \%#', 'bcn')? '<bs>= '
					\ : search('\(*\<bar>!\)\%#', 'bcn') ? '= '
					\ : smartchr#one_of(' = ', ' == ', '=')
	inoremap <expr> . smartchr#loop(' . ', ' .. ', '..')
endfunction

