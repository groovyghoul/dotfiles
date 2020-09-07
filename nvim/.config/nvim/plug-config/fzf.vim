" -----------------
" FZF configuration
" -----------------

" Requires ripgrep
" https://github.com/BurntSushi/ripgrep
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" Launch fzf with CTRL+P.
nnoremap <silent> <C-p> :FZF -m<CR>

" Map a few common things to do with FZF.
nnoremap <silent> <Leader><Enter> :Buffers<CR>
nnoremap <silent> <Leader>l :Lines<CR>

" Find files with fzf
nmap <leader>p :Files!<CR>

nmap // :BLines!<CR>
nmap ?? :Rg!<CR>

" [[[ THE FOLLOWING IS NOT WORKING YET ]]]
" Allow passing optional flags into the Rg command.
"   Example: :Rg myterm -g '*.md'
"command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1, <bang>0)

" ---------------------
" Test mappings
" ---------------------
map <C-f> <Esc><Esc>:Files!<CR>
inoremap <C-f> <Esc><Esc>:BLines!<CR>
