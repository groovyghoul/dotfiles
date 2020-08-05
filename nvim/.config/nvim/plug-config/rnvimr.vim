" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1

nmap <space>r :RnvimrToggle<CR>

" Set up only two columns in miller mode and draw border with both
let g:rnvimr_ranger_cmd = 'ranger --cmd="set column_ratios 1,1"
            \ --cmd="set draw_borders both"'

" Customize the initial layout
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': float2nr(round(0.6 * &columns)),
            \ 'height': float2nr(round(0.6 * &lines)),
            \ 'col': float2nr(round(0.2 * &columns)),
            \ 'row': float2nr(round(0.2 * &lines)),
            \ 'style': 'minimal' }

" NOTE: sudo apt install ranger
