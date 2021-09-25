syntax enable 		" enable syntax highlighting
let mapleader = ','	" namespace shortcuts with a comma
set number		" show line numbers
set cursorline		" highlight the line the cursor is on



"--------- Plugins ---------"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'			" let Vundle manage Vundle, required
Plugin 'tpope/vim-vinegar'			" enhance the built-in directory browser (netrw)
Plugin 'preservim/nerdtree'			" add a full-featured file system explorer
Plugin 'ctrlpvim/ctrlp.vim'			" searching files with fuzzy matching
Plugin 'sonph/onehalf'				" install a theme
Plugin 'vim-airline/vim-airline'		" better status bar
Plugin 'vim-airline/vim-airline-themes'		" themes compatible with improved status bar
Plugin 'MarcWeber/vim-addon-mw-utils'           " snippets
Plugin 'tomtom/tlib_vim'                        " snippets
Plugin 'garbas/vim-snipmate'			" snippets

call vundle#end()            " all plugins must be loaded before this line
filetype plugin indent on    " required



"--------- Visuals ---------"
colorscheme onehalfdark
let g:airline_theme='distinguished'

set t_CO=256		" force 256 colors on the terminal

" enable truecolors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif



"--------- Splits ---------"
set splitbelow
set splitright



"--------- File Browsing & Search ---------"
set hlsearch		"highlight search results
set incsearch		"turn on incremental search

" simple highlight removal
nmap <leader><space> :nohlsearch<cr>

"
" CtrlP
"
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\vendor\|git'
nmap <c-R> :CtrlPBufTag<cr>
nmap <c-e> :CtrlPMRUFiles<cr>

"
" NERDTree
"
nmap <leader>n :NERDTreeToggle<cr>
let NERDTreeShowHidden=1	" show hidden files
let NERDTreeHijackNetrw=0	" don't let NERDTree override vinegar



"--------- Mappings ---------"

" exit various modes by pressing ,, 
imap <leader>, <Esc>
vmap <leader>, <Esc>
smap <leader>, <Esc>
xmap <leader>, <Esc>
cmap <leader>, <Esc>
omap <leader>, <Esc>

" edit the vim configuration file
nmap <leader>ev :tabedit $MYVIMRC<cr>

" edit the snippets file
nmap <leader>es :e .vim/snippets/<cr>

" easier tab closing
imap <leader>c :tabclose<cr>
nmap <leader>c :tabclose<cr>
vmap <leader>c :tabclose<cr>

" quicker toggling between buffers
nmap <leader>b <C-^>



"--------- AutoCommands ---------"

"automatically source .vimrc upon save
augroup autosourcing
	autocmd!	
	autocmd BufWritePost .vimrc source %
augroup END
