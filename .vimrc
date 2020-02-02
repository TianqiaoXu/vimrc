" filename: vimrc
" authname: xutianqiao
" version:  v2.0

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" standard plugin
let g:loaded_gzip        = 1
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
let g:loaded_tarPlugin   = 1
let g:loaded_tar         = 1
let g:loaded_zipPlugin   = 1
let g:loaded_zip         = 1
let g:loaded_vimballPlugin  = 1
let g:loaded_vimball        = 1

" basic
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
language messages zh_CN.utf-8
set clipboard=unnamed
set number
set relativenumber
set ruler
syntax enable
syntax on
set matchtime=1
set nobackup
set noswapfile
set autochdir
set noerrorbells
set history=1000
set autoread

" indent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set list
"set listchars=tabs:,trail:▫
set scrolloff=5

" wrap
set wrap
set tw=0

" backspace
set backspace=indent,eol,start

" fold
set foldmethod=manual
set foldlevel=99

" leadermap
let mapleader=" "

" Esc
inoremap <C-n> <esc>

" split
set splitright
set splitbelow

nnoremap sk :set nosplitbelow<cr>:split<cr>:set splitbelow<cr>
nnoremap sj :set splitbelow<cr>:split<cr>
nnoremap sh :set nosplitright<cr>:vsplit<cr>:set splitright<cr>
nnoremap sl :set splitright<cr>:vsplit<cr>

map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>h <C-w>h
map <leader>l <C-w>l

nnoremap <leader><up> :res +5<cr>
nnoremap <leader><down> :res -5<cr>
nnoremap <leader><left> :vertical resize-5<cr>
nnoremap <leader><right> :vertical resize+5<cr>

" status
set laststatus=2
set autochdir
set formatoptions-=tc
set showcmd
set showmode

" command complete
set wildignore=log/**,node_modules/**,target/**,tmp/**,*rbc
set wildmenu
set wildmode=longest,list,full

" search
set hlsearch
exec "nohlsearch"
set incsearch
set smartcase
nnoremap <leader><cr> :nohl<cr>
nnoremap n nzz
nnoremap N Nzz

" todo
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" write quit
nnoremap Q :q<cr>
nnoremap <leader>q :q<cr>
nnoremap W :w<cr>
nnoremap <leader>w :w<cr>

" slide
nnoremap J 5j
nnoremap K 5k
nnoremap L $
nnoremap H 0

" tabs
nnoremap te :tabe<cr>
nnoremap tj :-tabnext<cr>
nnoremap tk :+tabnext<cr>

call plug#begin('~/.vim/plugged')

" Dress
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'crusoexia/vim-monokai'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" YouCompleteMe
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }

" Markdown
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }

" Other
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-smooth-scroll'
Plug 'scrooloose/nerdcommenter'
Plug 'skywind3000/vim-terminal-help'

call plug#end()

" Dress
set termguicolors
"colorscheme monokai
"let g:airline_theme="molokai"
let g:airline_powerline_fonts = 1
nnoremap <Leader>s :SemanticHighlightToggle<cr>

" YCM
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap g/ :YcmCompleter GetDoc<CR>
nnoremap gt :YcmCompleter GetType<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_use_clangd = 0

" Nerd tree
nnoremap gn :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_plus_switch = 1

" LeaderF
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>
" should use `Leaderf gtags --update` first
let g:Lf_RootMarkers = ['.git', '.root', '.svn']
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
