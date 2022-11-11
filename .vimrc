set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
" All of your Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'lervag/vimtex'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-syntastic/syntastic'
"Plug 'sheerun/vim-polyglot'       "Language pack
Plug 'preservim/nerdtree'
Plug 'townk/vim-autoclose'        "Auto close brackets
Plug 'dracula/vim',{'as':'dracula'} "Dracula theem
Plug 'preservim/nerdcommenter'
call plug#end()


" Nerdtree settings"
let NERDTreeShowBookmarks = 1   " Show the bookmarks table
let NERDTreeShowHidden = 1      " Show hidden files
let NERDTreeShowLineNumbers = 0 " Hide line numbers
let NERDTreeMinimalMenu = 1     " Use the minimal menu (m)
let NERDTreeWinPos = "left"     " Panel opens on the left side
let NERDTreeWinSize = 31        " Set panel width to 31 columns
nmap <F2> :NERDTreeToggle<CR>

set hlsearch!
nnoremap <F3> :set hlsearch!<CR>

set background=dark
colorscheme dracula
"colorscheme codedark

filetype plugin indent on
"filetype indent on

set t_Co=256 " 256 colors in terminal

if has('gui_gnome')
  set guifont=Ubuntu\ Mono\ 8.4
endif

set hidden
set number relativenumber
set noswapfile
set laststatus=2
set tabstop=4 shiftwidth=4 expandtab softtabstop=0 autoindent smarttab
"set list

let &colorcolumn='80'

set cursorline
set smartindent
set wrap
set incsearch  " Enable incremental search
set hlsearch   " Enable highlight search
set ignorecase
set smartcase
set history=10000
set encoding=utf-8
set linebreak
set backspace=indent,eol,start
set nofoldenable
set path+=**

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

" Use clipboard as default register
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

set complete+=kspell
"set completeopt+=menuone,longest


" For Latex
let g:tex_flavor = "latex"
let g:vimtex_view_general_viewer="okular"
noremap <Leader>b :VimtexCompile    <CR>

" Grammar Check
syntax spell toplevel
syn sync maxlines=2000
syn sync minlines=500
"en_gb = British
setlocal spell spelllang=en_gb
hi clear SpellBad
hi SpellBad cterm=underline
