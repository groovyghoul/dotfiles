" auto-install vim-plug
" Note from Richard -- someday, change to use this, instead of ~/.vim/plugged
"if empty(glob('~/.config/nvim/autoload/plug.vim'))
  "silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    "\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ""autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
"endif

"call plug#begin('~/.config/nvim/autoload/plugged')

call plug#begin('~/.vim/plugged')

Plug 'OmniSharp/omnisharp-vim'
" Plug 'nickspoons/vim-sharpenup'
" Plug 'dense-analysis/ale'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'scrooloose/syntastic'
" Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'vifm/vifm.vim'
Plug 'ekalinin/dockerfile.vim'
Plug 'elzr/vim-json'
Plug 'mattn/emmet-vim'
Plug 'pbrisbin/vim-mkdir'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'bluz71/vim-moonfly-colors'
" Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'
Plug 'preservim/nerdcommenter'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plug 'liuchengxu/vim-which-key'
Plug 'vimwiki/vimwiki'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
