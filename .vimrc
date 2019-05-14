set nocompatible              " be iMproved, required
filetype off                  " required

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'flazz/vim-colorschemes'
Plug 'jacoborus/tender.vim'
Plug 'joshdick/onedark.vim'

"go
Plug 'myitcv/govim'

"rust
Plug 'rust-lang/rust.vim'
Plug 'timonv/vim-cargo'
Plug 'racer-rust/vim-racer'

"python
"Plug 'nvie/vim-flake8'
"Plug 'tell-k/vim-autopep8'
"Plug 'vim-scripts/indentpython.vim'

" Initialize plugin system
call plug#end()

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set hidden

set encoding=utf-8
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set softtabstop=4   " number of spaces in tab when editing
set expandtab     " tabs are spaces

set backspace=indent,eol,start
                    " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set nobackup
set noswapfile
set smartindent
set wildmenu

set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding with the spacebar
nnoremap <space> za
nnoremap <leader><space> :nohlsearch<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

set cursorline  

" highlight last inserted text
nnoremap gV `[v`]

filetype indent on

filetype plugin indent on

set t_Co=256
syntax enable

if (has("termguicolors"))
 set termguicolors
endif
"colorscheme vividchalk

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

" colorscheme tender

set laststatus=2
set pastetoggle=<F2>

set colorcolumn=80
hi ColorColumn ctermbg=235

"mac clipboard support
set clipboard=unnamed

"ALE Settings

let g:airline#extensions#ale#enabled = 1
let g:ale_open_list = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

"GO specific changes

" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"

au FileType go set noexpandtab
au FileType go set tw=120
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)

"let g:syntastic_loc_list_height=3

" Lint and Vet on save
" let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
"let g:syntastic_go_checkers = ['go', 'golint', 'errcheck', 'govet', 'gotest']

syntax enable  
filetype plugin on  
set number  
let g:go_disable_autoinstall = 0

" Highlight
let g:go_highlight_functions = 1  
let g:go_highlight_methods = 1  
let g:go_highlight_structs = 1  
let g:go_highlight_operators = 1  
let g:go_highlight_build_constraints = 1  



"let g:rustfmt_command = '/Users/sudarshan/.cargo/bin/rustfmt'
"let g:rustfmt_command = "cargo fmt -- "
let g:rustfmt_autosave = 1 " format Rust files on save
let g:rustfmt_fail_silently = 1 " else rustfmt will bring cursor to bottom of window on syntax failure

"let g:syntastic_rust_checkers = ['cargo']

let g:racer_cmd = "/Users/sudarsan/.cargo/bin/racer"
let g:racer_experimental_completer = 1

au FileType rust nmap <buffer> gd <Plug>(rust-def)
au FileType rust nmap <buffer> gs <Plug>(rust-def-split)
au FileType rust nmap <buffer> gx <Plug>(rust-def-vertical)
au FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)

" python changes
au FileType python set tabstop=4
au FileType python set shiftwidth=4
au FileType python set tw=120
"let g:syntastic_python_checkers=['flake8']

"Makefile
"autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
