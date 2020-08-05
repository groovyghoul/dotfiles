let mapleader=","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap keys <=
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NOTES: For ZFZ mappings, see FZF-specific configuration
"        section under 'Custom plugin configurations'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap jj <ESC>

" Allow cursor movements during insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l
inoremap <C-d> <end>

" if in word-wrap mode (:set wrap/nowrap), move up down physical lines, not
" logical
noremap j gj
noremap k gk

" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x

nmap <leader>n :call ToggleNERDTree()<CR>
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>Q :qa!<CR>

" Vifm specific bindings
map <Leader>vv :Vifm<CR>
map <Leader>vs :VsplitVifm<CR>
map <Leader>sp :SplitVifm<CR>
map <Leader>dv :DiffVifm<CR>
map <Leader>tv :TabVifm<CR>

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

