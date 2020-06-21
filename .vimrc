set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set number
set relativenumber
set tabstop=4
set expandtab
set nobackup
set nowrap
set shiftwidth=4

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'OmniSharp/omnisharp-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

call vundle#end()
filetype plugin indent on

let g:OmniSharp_server_stdio = 1
let g:OmniSharp_server_path = '/mnt/c/OmniSharp/omnisharp.win-x64/OmniSharp.exe'
let g:OmniSharp_translate_cygwin_wsl = 1

set noshowmatch

"supertab
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
let g:SuperTabClosePreviewOnPopupClose = 1

set completeopt=longest,menuone,preview

set splitbelow

let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
let g:syntastic_cs_checkers = ['code_checker']

let mapleader=","

" Allow cursor movements during insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l
inoremap <C-d> <end>

inoremap jj <ESC>

nmap <F6> :NERDTreeToggle<CR>

" Requires ripgrep
" https://github.com/BurntSushi/ripgrep
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'

" Find files with fzf
nmap <leader>p :Files!<CR>

nmap // :BLines!<CR>
nmap ?? :Rg!<CR>

augroup omnisharp_commands
	autocmd!

	autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

	autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
	autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

	autocmd BufWritePost *.cs call OmniSharp#AddToProject()

	autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

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
	
command! Config execute ":e ~/.vimrc"
command! Nconfig execute ":e $MYVIMRC"

nmap <leader>n :call ToggleNERDTree()<CR>
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>Q :qa!<CR>
