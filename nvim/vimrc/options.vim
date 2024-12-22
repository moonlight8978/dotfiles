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

" Word break, and show break indicator
set linebreak
set showbreak=↪

" Always show 5 lines when scroll off the screen
set scrolloff=5

set termguicolors

" Use built-in filetype plugin
filetype plugin indent on

" Clipboard settings, always use clipboard for all delete, yank, change, put
" operation, see https://stackoverflow.com/q/30691466/6064933
if !empty(provider#clipboard#Executable())
  set clipboard+=unnamedplus
endif

" Set matching pairs of characters and highlight matching brackets
set matchpairs+=<:>,「:」,『:』,【:】,“:”,‘:’,《:》

" Ignore case in general, but become case-sensitive when uppercase is present
set ignorecase smartcase

" File and script encoding settings for vim
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" Disable showing current mode on command line since statusline plugins can show it.
" TODO: float terminal does not show TERMINAL mode
" set noshowmode

" Mouse behaviour
set mousemodel=popup
set mousescroll=ver:1,hor:0


