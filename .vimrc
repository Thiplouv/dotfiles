" VIM Configuration for Thibault Plouviez


" Enable syntax highlighting 
syntax on

" Show line numbers
set number

" Auto closing
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Enable filetype detection for plugins and indentation options
filetype plugin indent on

" Use 4 spaces for tabulation
set expandtab
set shiftwidth=4
set smartindent
set tabstop=4
set softtabstop=4

" Enable auto indentation
set autoindent

" Wrap on column 80
set wrap
set textwidth=79

" Set autoformat to text and comment
autocmd BufWinEnter,BufNewFile * setlocal formatoptions+=tc

"Color the column after textwidth
set colorcolumn=+1

"Disable swapfiles
set noswapfile
