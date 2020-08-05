" -----------------------
" Omnisharp configuration
" -----------------------
filetype plugin on

let g:OmniSharp_want_snippet=1

"let g:OmniSharp_selector_ui = 'ctrlp'

let g:ale_linters = { 'cs': ['OmniSharp'] }

let g:ale_set_loclist = 0

let g:ale_set_quickfix = 1

let g:ale_list_window_size = 5

let g:OmniSharp_server_stdio = 1
let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_selector_ui = 'fzf'

let g:OmniSharp_popup_options = {
            \ 'highlight': 'Normal',
            \ 'padding': [1],
            \ 'border': [1]
            \}

"let g:OmniSharp_server_path = '/mnt/c/OmniSharp/omnisharp.win-x64/OmniSharp.exe'
"let g:OmniSharp_translate_cygwin_wsl = 1

" inoremap <expr> <Tab> pumvisible() ? '<C-n>' : getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'

set completeopt=longest,menuone,preview

set splitbelow

" let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
" let g:syntastic_cs_checkers = ['code_checker']

" -----------------------
" Omnisharp configuration
" -----------------------
augroup omnisharp_commands
	autocmd!

	autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

	autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
	autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

"	autocmd BufWritePost *.cs call OmniSharp#AddToProject()

"	autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

	autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
	autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementation<cr>
	autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
	autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
	autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>

	autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>

	autocmd FileType cs nnoremap <leader>x :OmniSharpFixIssue<cr>
	autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsing<cr>
	autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
	autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>

	autocmd FileType cs nnoremap <C-K> :OmniSharpNavigationUp<cr>

	autocmd FileType cs nnoremap <C-J> :OmniSharpNavigationDown<cr>
augroup END
