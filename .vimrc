set nocompatible              " be iMproved, required
filetype off                  " required

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')


Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'flazz/vim-colorschemes'
Plug 'rust-lang/rust.vim'
Plug 'timonv/vim-cargo'
Plug 'racer-rust/vim-racer'
Plug 'jacoborus/tender.vim'
Plug 'fatih/vim-go'
Plug 'vim-syntastic/syntastic'
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go', { 'do': 'make'}
"python
Plug 'zchee/deoplete-jedi'

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

set foldmethod=syntax  
set foldnestmax=10
set nofoldenable
set foldlevel=2

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
colorscheme tender

" colorscheme vividchalk

set laststatus=2
set pastetoggle=<F2>

set colorcolumn=80
hi ColorColumn ctermbg=235

"Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"ale settings
"let g:airline#extensions#ale#enabled = 1
"let g:ale_open_list = 1
"let g:ale_linters = {'go' : 'all'}
"let g:ale_lint_on_enter = 1

"mac clipboard support
set clipboard=unnamed

"JAVASCRIPT BASED CHANGES
" To Automatically insert closing loop and reposition cursor

autocmd FileType javascript inoremap (; ();<Esc>hi
autocmd FileType javascript inoremap {<CR> {<CR>}<Esc><S-o>

let b:javascript_fold = 1
let JSHintUpdateWriteOnly = 1
let g:JSHintHighlightErrorLine = 0

"GO specific changes

" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)

let g:syntastic_loc_list_height=3

" Lint and Vet on save
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck', 'govet', 'gotest']

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

"" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
"" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
"" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3

" Use deoplete
let g:deoplete#enable_at_startup = 1
set completeopt=longest,menuone


" deoplete go
let g:deoplete#sources#go#gocode_binary = '/Users/sudarshan/dev/go/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" rust changes

let g:rustfmt_command = '/Users/sudarshan/.cargo/bin/rustfmt'
let g:rustfmt_command = "cargo fmt -- "
let g:rustfmt_autosave = 1 " format Rust files on save
let g:rustfmt_fail_silently = 1 " else rustfmt will bring cursor to bottom of window on syntax failure

let g:syntastic_rust_checkers = ['cargo']

let g:racer_cmd = "/Users/sudarshan/.cargo/bin/racer"
let g:racer_experimental_completer = 1

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" python changes
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 | 
    \ set encoding=utf-8 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
