" SYSTEM

"" Compatibility

""" Disable Vi compatibility
set nocompatible

"" Clipboard

""" Enable access to the system clipboard
set clipboard=unnamed

"" Files

""" Detect changes to open files
set autoread

"" Privacy

""" Disable swap files
set noswapfile

""" Disable persistent undo files
set noundofile

""" Encryption method
set cm=blowfish2

"" Fuzzy Find

""" Find recursively from base directory
set path+=**

""" Show menu of found items on <Tab>
set wildmenu

" INTERFACE

"" Layout

""" Show line numbers on left of screen
set number

""" Display keystrokes while typing commands
set showcmd

""" Always show the status line
set laststatus=2

""" Enable faster redrawing
set ttyfast

""" Disable the welcome message
set shortmess+=I

"" Colors

""" Global color scheme (from $HOME/.vim/colors)
colorscheme hybrid_material

""" Background color
set background=dark

""" Enable 256 colorspace support
set t_Co=256

""" Enable syntax coloring
syntax on

""" Highlight corresponding braces
set showmatch

"" Bell

""" Disable audible and visual bell
set belloff=all

"" Indentation

""" Copy indent level when inserting a new line
set autoindent

""" Auto-indent when inserting a new line
set smartindent

"" Backspace

""" Fix backspace functionality
set backspace=indent,eol,start

" SPELLING

"" Dictionary

""" Include dictionary words file
set dictionary+=$HOME/.vim/dict/words

""" Underline misspelled words
hi! SpellBad cterm=underline ctermbg=none ctermfg=none

"" Auto Enable Spell Checking for File Types

""" Text files
autocmd BufRead,BufNewFile *.txt setlocal spell

""" Markdown files
autocmd BufRead,BufNewFile *.md setlocal spell

""" File with no an extension
autocmd BufRead,BufNewFile * if expand('%:t') !~ '\.' | setlocal spell | endif

"" Indentation

""" Convert tabs into spaces
set smarttab

""" Spaces per <Tab>
set tabstop=2

""" Use appropriate number of spaces on <Tab> in Insert and Visual modes
set expandtab

""" Spaces per <Tab> when performing editing operations
set softtabstop=2

""" Space for auto indentation
set shiftwidth=2

""" Round indents to a multiple of $shiftwidth
set shiftround

"" Search

""" Ignore case when search contains only lowercase letters
set ignorecase

""" Use case when search contains a capital letter
set smartcase

""" Highlight search matches
set hlsearch

""" Search incrementally while typing
set incsearch

""" Enable searching with regex expressions
set magic

" GRAPHICAL VIM

"" When Using gVim
if has('gui_running')

  """ Font
  set guifont=Consolas:h14

  """ Hide the menubar
  set guioptions -=m

  """ Hide the toolbar
  set guioptions -=T

endif

" PLUGINS 

"" Vundle

""" Add Vundle to the runtime path
set rtp+=$HOME/.vim/bundle/Vundle.vim

""" Define Vundle plugins
call vundle#begin()

  """" File explorer
  Plugin 'scrooloose/nerdtree'

  """" Display git info in file explorer
  Plugin 'xuyuanp/nerdtree-git-plugin'

  """" Display git indicators in left of screen
  Plugin 'airblade/vim-gitgutter'

  """" Comment & uncomment across file types
  Plugin 'tpope/vim-commentary'

  """" Smart autocompletion
  Plugin 'ervandew/supertab'

call vundle#end()

"" NerdTree

""" Show hidden files
let NERDTreeShowHidden=1

""" Close explorer upon opening a file
let g:NERDTreeQuitOnOpen=0

" SHORTCUTS

"" Leader Key
let mapleader = '\'

"" Tabs

""" Create a new tab
nnoremap <silent> <C-W>t :tabnew<CR>

"" Spelling

""" Enable spell checking in the current buffer
nnoremap <leader>S :setlocal spell spelllang=en_gb<CR>

""" Disable spell checking in the current buffer
nnoremap <leader>D :setlocal nospell<CR>

"" Navigation

""" Toggle the file explorer
map <silent> <C-\> :NERDTreeToggle<CR> 

