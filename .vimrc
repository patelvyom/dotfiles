call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'lervag/vimtex'

call plug#end()

set nocompatible
filetype plugin on

packadd! dracula
syntax enable
colorscheme dracula

set background=dark
set number relativenumber
set noswapfile
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

set autoindent
set smartindent
set nowrap
set incsearch
set hlsearch
set ignorecase
set smartcase
set history=10000
set encoding=utf-8
set linebreak
set backspace=indent,eol,start

set path+=**

" Use clipboard as default register
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

set complete+=kspell
"set completeopt+=menuone,longest
set spell spelllang=en_us
