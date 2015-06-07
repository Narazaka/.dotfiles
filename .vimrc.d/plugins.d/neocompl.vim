if neobundle#is_installed('neocomplete.vim')
	" neocomplcache
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#enable_smart_case = 1
	let g:neocomplete#sources#syntax#min_keyword_length = 3
	let g:neocomplete#auto_completion_start_length = 2
	let g:neocomplete#max_list = 35
	let g:neocomplete#enable_auto_select = 0
	" Enable heavy features.
	" Use camel case completion.
	let g:neocomplete#enable_camel_case_completion = 1
	" Use underbar completion.
	let g:neocomplete#enable_underbar_completion = 1
	" Enable heavy omni completion.
	if !exists('g:neocomplete#sources#omni#input_patterns')
		let g:neocomplete#sources#omni#input_patterns = {}
	endif
	let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
	let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
	let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
	" For perlomni.vim setting.
	" https://github.com/c9s/perlomni.vim
	let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"	inoremap <expr><TAB> pumvisible() ? neocomplete#close_popup() : "\<TAB>"
	inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : "<CR>"
	inoremap <expr><TAB> pumvisible() ? "<C-n>" : "<TAB>"
	"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
elseif neobundle#is_installed('neocomplcache.vim')
	" if has('win32') + has('win64')
	" let g:neocomplcache_temporary_dir = 'O:/.neocon'
	" endif
	" neocomplcache
	let g:neocomplcache_enable_at_startup = 1
	let g:neocomplcache_enable_smart_case = 1
	let g:neocomplcache_min_syntax_length = 4
	let g:neocomplcache_auto_completion_start_length = 2
	" popup length
	let g:neocomplcache_max_list = 35
	" Enable heavy features.
	" Use camel case completion.
	let g:neocomplcache_enable_camel_case_completion = 1
	" Use underbar completion.
	let g:neocomplcache_enable_underbar_completion = 1
	" 日本語を補完候補として取得しないようにする
	" let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
	" Enable heavy omni completion.
	if !exists('g:neocomplcache_force_omni_patterns')
	  let g:neocomplcache_force_omni_patterns = {}
	endif
	let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
	let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
	let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
	let g:NeoComplCache_EnableAutoSelect = 1
	inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "<CR>"
	inoremap <expr><TAB> pumvisible() ? "<C-n>" : "<TAB>"
	" neocomplcache-clang
	let g:neocomplcache_clang_executable_path = 'C:/usr/LLVM/bin'
	let g:neocomplcache_clang_library_path = 'C:/usr/LLVM/bin'
	let g:neocomplcache_clang_user_options = '-IC:/usr/wxWidgets/2.9.4/include'
endif
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
