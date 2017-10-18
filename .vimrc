set nocompatible              " be iMproved, required
filetype off                  " required

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
execute pathogen#infect()
execute pathogen#helptags()

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

if has('gui_running')
    set background=dark
    let g:solarized_termcolors=256
    colorscheme solarized 
else

    "let g:solarized_termcolors=256
    "set background=light
    colorscheme vividchalk
    "let g:rehash256=1
endif

set laststatus=2
set pastetoggle=<F2>

set colorcolumn=80
hi ColorColumn ctermbg=235

set foldenable 
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

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Python specific changes
let python_highlight_all=1
syntax on

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" C specific changes
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

" This sets vim path to also include these directories for searching
let &path.="src/include,/usr/include/AL,"

" automate make
set makeprg=make\ -C\ ../build\ -j9

" rust changes

let g:rustfmt_autosave = 1

let g:syntastic_rust_checkers = ['cargo']
