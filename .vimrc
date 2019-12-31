call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'terryma/vim-smooth-scroll'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/solarized'
Plug 'scrooloose/nerdcommenter'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }

call plug#end()

map <F2> :NERDTreeToggle<CR>

syntax on
set nu
set scrolloff=5
set autoindent
set smartindent
set showcmd
set showmode
set encoding=utf-8
set t_Co=256
set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=80
set wrap
set linebreak
set wrapmargin=2
set matchtime=1
set nobackup
set noswapfile
set autochdir
set noerrorbells
set history=1000
set autoread
set wildmenu

map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

set tags=./tags;,tags

