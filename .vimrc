set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Keep Plugin commands between vundle#begin/end.
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"show path in tab
let &titlestring = @%
set title

" status line stuff
set laststatus=2
set statusline+=%F

" Color schemes
Plugin 'flazz/vim-colorschemes'

" airline for a nice status line
Plugin 'bling/vim-airline'

" search through open buffers
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_max_files=0
let g:ctrlp_tabpage_position = 'ac'

" NERDCommenter
filetype plugin on
Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1

" Supertab for autocompletion
Plugin 'ervandew/supertab'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" TO USE VUNDLE
" Add Plugin 'user/repo'
" run `source ~/.vimrc`
" run BundleInstall
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" custom stuff
let mapleader = ","

map <leader>,bd :bd
map <leader>,ls :ls

map gh :tabprevious
map gl :tabnext
map gj :bp
map gk :bn

syntax enable
colorscheme zenburn

set showmatch           " Show matching brackets
set wildmode=list:longest,full
set expandtab tabstop=2 shiftwidth=2 softtabstop=2
map Q @q                " replay macro assigned to Q (overwrite ex mode)  (ex mode is stupi')

" Allow usage of mouse in iTerm
set ttyfast
set mouse=a

"Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

"HTML Editing
set matchpairs+=<:>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" set paste | set nopaste
set pastetoggle=<F2>

" copy to system clipboard
noremap <Leader>y "+y

" see line numbers
set number

