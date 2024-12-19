scriptencoding utf-8

" Turn on line numbers
set number

" Use , as <leader>
let mapleader = ","

" Enable syntax highlighting
syntax enable

" Disable swapfile
set noswapfile

" Tab settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab


"set linebreak
"set showbreak=↪

"set scrolloff=3

set termguicolors

" Use built-in filetype plugin
filetype plugin on

" Clipboard settings, always use clipboard for all delete, yank, change, put
" operation, see https://stackoverflow.com/q/30691466/6064933
if !empty(provider#clipboard#Executable())
  set clipboard+=unnamedplus
endif
