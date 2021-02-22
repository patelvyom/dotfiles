set nocompatible
filetype plugin on

packadd! dracula
syntax enable
colorscheme dracula

set background=dark
set number relativenumber

set tabstop=4
set autoindent

set hlsearch
set ignorecase
set smartcase

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
