set nocompatible              " be iMproved, required
filetype off                  " required

" setup command
" https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are the plugin
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'Valloric/YouCompleteMe'
Plugin 'craigemery/vim-autotag'

" All of your Plugins must be added before the following line
call vundle#end()            " required
if has ("autocmd")
    filetype plugin indent on    " required
endif
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" history remembered
set history=500
" show No
set number

" 7 lines to the cursor
set so=7

" current position
set ruler

" height of command bar
set cmdheight=2

" configure backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" high light search
set hlsearch
set incsearch

" add a bit extra to the left
set foldcolumn=1

" enable syntax highlighting
syntax enable
" scheme
try
	colorscheme elflord 
catch
endtry
set background=dark

set encoding=utf8

" globally case insensitive
set ignorecase
" smart about cases/capital when search
set smartcase

" Use space instead of tabs
set expandtab
" be smart with tabs
set smarttab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" smart indent
set autoindent
set smartindent
set cindent

" always show the status line
set laststatus=2

" setup for fold method <zo> open, <zc> close
set foldmethod=indent
set foldlevel=1
"set foldclose=all

" quick search
map <space> /

" smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" nerd tree figuration
let g:NERDTreeWinPos="left"
let NERDTreeShowHidden=0
let g:NERDTreeWinSize=25
let g:NERDTreeDirArrowExpandable= '+'
let g:NERDTreeDirArrowCollapsible= '-'

" ctrl-n as nerdtree
map <C-n> :NERDTreeToggle<CR>

" save fold information
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

"auto open nerdtree when start vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"auto close alone tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
