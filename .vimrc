if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
set clipboard=unnamed
set number
set relativenumber
set ruler
set cursorline
syntax enable
syntax on

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5

set wrap
set tw=0

set backspace=indent,eol,start

set foldmethod=indent
set foldlevel=99

set splitright
set splitbelow

set laststatus=2
set autochdir
set showcmd
set formatoptions-=tc

set wildignore=log/**,node_modules/**,target/**,tmp/**,*rbc
set wildmenu
set wildmode=longest,list,full

set hlsearch
exec "nohlsearch"
set incsearch
set smartcase

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

let mapleader=" "

nnoremap Q :q<cr>
nnoremap S :w<cr>

nnoremap n nzz
nnoremap N Nzz

nnoremap J 5j
nnoremap K 5k
nnoremap L 5L
nnoremap H 5h

nnoremap M $

map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>h <C-w>h
map <leader>l <C-w>l

nnoremap sk :set nosplitbelow<cr>:split<cr>:set splitbelow<cr>
nnoremap sj :set splitbelow<cr>:split<cr>
nnoremap sh :set nosplitright<cr>:vsplit<cr>:set splitright<cr>
nnoremap sl :set splitright<cr>:vsplit<cr>

nnoremap <leader><up> :res +5<cr>
nnoremap <leader><down> :res -5<cr>
nnoremap <leader><left> :vertical resize-5<cr>
nnoremap <leader><right> :vertical resize+5<cr>

nnoremap te :tabe<cr>
nnoremap tj :-tabnext<cr>
nnoremap tk :+tabnext<cr>

call plug#begin('~/.vim/plugged')

" Dress
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Taglist
Plug 'vim-scripts/taglist.vim'

" YouCompleteMe
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }

" Fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --all' }
Plug 'junegunn/fzf.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

" Other
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-smooth-scroll'
Plug 'scrooloose/nerdcommenter'

call plug#end()

" Dress
set termguicolors
let g:airline_theme='dracula'

" YCM
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap g/ :YcmCompleter GetDoc<CR>
nnoremap gt :YcmCompleter GetType<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_use_clangd = 0
let g:ycm_python_binary_path = g:ycm_python_interpreter_path

" Nerd tree
map <F2> :NERDTreeToggle<CR>

" Taglist
nnoremap tl :TagbarOpenAutoClose<CR>
set tags=./tags;,tags

set showcmd
set showmode
set encoding=utf-8
set matchtime=1
set nobackup
set noswapfile
set autochdir
set noerrorbells
set history=1000
set autoread

map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

