"Don't try to be vi compatible
set nocompatible

" Install vim-plug if it isn't installed already
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Install plugins using Plug.
" If first time setting up, run :PlugInstall
call plug#begin('~/.vim/plugged')

" Core
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'jlfwong/vim-mercenary'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdcommenter'
Plug 'flowtype/vim-flow'

" Languages
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'

" Theme
Plug 'tomasr/molokai'

call plug#end()

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping
set visualbell

" Necessary for devicon config
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11
let g:airline_powerline_fonts = 1

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

"Colorscheme
colorscheme molokai

" Toggle NERDTree with Ctrl N
map <C-n> :NERDTreeToggle<CR>

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

" Highlight Search
set hlsearch

" Don't autocomment next line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Commenting
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
