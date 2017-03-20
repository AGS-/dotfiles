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
Plug 'AGS-/onedark.vim'

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

" Colorscheme
colorscheme onedark

" Italic Comments
highlight Comment gui=italic
highlight Comment cterm=italic 

" Italic HTML Args
highlight htmlArg gui=italic
highlight htmlArg cterm=italic 

" Types
highlight Type gui=italic
highlight Type cterm=italic

" XML Args (For JSX)
highlight xmlAttrib gui=italic
highlight xmlAttrib cterm=italic

"JS 'this'
highlight jsthis gui=italic
highlight jsthis cterm=italic

" Toggle NERDTree with Ctrl N
map <C-n> :NERDTreeToggle<CR>

" Let NERDTree see dotfiles
let NERDTreeShowHidden = 1

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

" Make CtrlP 'listen' to .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
