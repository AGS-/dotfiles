"Don't try to be vi compatible
set nocompatible

" Install vim-plug if it isn't installed already
if !has('win32')
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
  endif
endif

set termguicolors
" Install plugins using Plug.
" If first time setting up, run :PlugInstall
if has('nvim')
  call plug#begin('~/.config/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

" Core
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-fugitive'
Plug 'jlfwong/vim-mercenary'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdcommenter'
if !has('win32')
  Plug 'wincent/command-t', {
        \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
        \ }
else
  " Switch back to command-t once we can compile in windows
  Plug 'ctrlpvim/ctrlp.vim'
  " Plug 'wincent/command-t'
endif
Plug 'wincent/ferret'
Plug 'valloric/youcompleteme'
Plug 'enricobacis/vim-airline-clock'
" Track the engine.
Plug 'SirVer/ultisnips'

" Languages
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'
Plug 'groenewege/vim-less'

" Theme
Plug 'AGS-/onedark.vim'

call plug#end()

" Make sure backspace works as expected
set backspace=indent,eol,start

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

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

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

" Disable easy mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Command T
let g:CommandTCancelMap=['<ESC>', '<C-c>']

let g:CommandTEncoding='UTF-8'
let g:CommandTFileScanner='watchman'
let g:CommandTMaxCachedDirectories=10
let g:CommandTMaxFiles=1500000
let g:CommandTScanDotDirectories=1
let g:CommandTTraverseSCM='pwd'
let g:CommandTWildIgnore=&wildignore
let g:CommandTWildIgnore.=',*/.git'
let g:CommandTWildIgnore.=',*/.hg'
let g:CommandTWildIgnore.=',*/bower_components'
let g:CommandTWildIgnore.=',*/tmp'
let g:CommandTWildIgnore.=',*/vendor'

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1

" Ctrl-P
let g:ctrlp_custom_ignore = 'bower_components\|node_modules\|DS_Store\|git|tmp|vendor'

" UltiSnips
" Copied from @wincent's .vimrc

" YouCompleteMe and UltiSnips compatibility.
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" Prevent UltiSnips from removing our carefully-crafted mappings.
let g:UltiSnipsMappingsToIgnore = ['autocomplete']

if has('autocmd')
  augroup WincentAutocomplete
    autocmd!
    autocmd! User UltiSnipsEnterFirstSnippet
    autocmd User UltiSnipsEnterFirstSnippet call autocomplete#setup_mappings()
    autocmd! User UltiSnipsExitLastSnippet
    autocmd User UltiSnipsExitLastSnippet call autocomplete#teardown_mappings()
  augroup END
endif

" Additional UltiSnips config.
if has('nvim')
	let g:UltiSnipsSnippetsDir = '~/.config/nvim/ultisnips'
else
	let g:UltiSnipsSnippetsDir = '~/.vim/ultisnips'
endif
let g:UltiSnipsSnippetDirectories = ['ultisnips']
