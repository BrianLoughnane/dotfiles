
" custom stuff
let mapleader = ","

map <leader>,bd :bd
map <leader>,ls :ls

map gh :tabprevious
map gl :tabnext
map gj :bp
map gk :bn

" NERDCommenter
filetype plugin on

" vundle me this

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"" Plugin 'tpope/vim-fugitive'
"" plugin from http://vim-scripts.org/vim/scripts.html
"" Plugin 'L9'
"  Git plugin not hosted on GitHub
"" Plugin 'git://git.wincent.com/command-t.git'
"  git repos on your local machine (i.e. when working on your own plugin)
"" Plugin 'file:///home/gmarik/path/to/plugin'
"  The sparkup vim script is in a subdirectory of this repo called vim.
"  Pass the path to set the runtimepath properly.
"" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"  Avoid a name conflict with L9
"" Plugin 'user/L9', {'name': 'newL9'}

" open buffer in new tab
:au BufAdd,BufNewFile * nested tab sball

"show path in tab
let &titlestring = @%
set title

" status line stuff
set laststatus=2
set statusline+=%F

" airline for a nice status line
Plugin 'bling/vim-airline'

" search through open buffers
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_max_files=0
let g:ctrlp_tabpage_position = 'ac'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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


syntax enable
colorscheme zenburn
set nocompatible        " Disable vi compatibility.
set textwidth=0         " Disable wrapping
set nowrap              " don't make it look like there are line breaks where there aren't
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

" SYSTEM CLIPBOARD COPY & PASTE SUPPORT
set pastetoggle=<F2> "F2 before pasting to preserve indentation
" Copy paste to/from clipboard
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"
map <silent><C-v> :set paste<CR>o<esc>"*]p:set nopaste<cr>"

"Toggle relative numbering, and set to absolute on loss of focus or insert mode
set rnu
function! ToggleNumbersOn()
  set nu!
  set rnu
endfunction
function! ToggleRelativeOn()
  set rnu!
  set nu
endfunction
"autocmd FocusLost * call ToggleRelativeOn()
"autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()
