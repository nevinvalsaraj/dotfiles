set nocompatible
set modelines=0

" Set up Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Appearance
Plugin 'tpope/vim-sensible'
Plugin 'croaker/mustang-vim'
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'

" IDE plugins
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'

" Language and syntax highlighting
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-jade'

" Git plugins
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

call vundle#end()

" set up autocomplete
set omnifunc=syntaxcomplete#Complete


" switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
    syntax on
endif

" Load syntax highlighting theme if supports >256 colors
if &t_Co >= 256 || has("gui_running")
    colorscheme mustang
    set background=dark
endif


" Make background transparent
hi Normal ctermbg=none

set colorcolumn=80

set fileformat=unix
set fileformats=unix,dos
set encoding=utf-8

" Map leader to custom kev
let mapleader = ","

" Remove backup options
set nobackup
set noswapfile

set nowrap              " don't wrap lines
set number              " show line numbers


" Search rules
"
set ignorecase          " ignores case when searching
set hlsearch            " highlight searches
set incsearch           " show search matches as you type
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase,
                        " case-sensitive otherwise

" clear out search with leader+space
nnoremap <leader><space> :noh<cr>


" Whitespace rules
"
set tabstop=4           " size of a hard tabstop
set shiftwidth=4        " size of an indent
set softtabstop=0       " a combination of spaces and tabs are used to simulate
                        " tab stops at a width other than hard tabstop
set expandtab           " convert all typed tabs to spaces
set copyindent          " copy the previous indentation on autoindenting
set shiftround          " use multiple of shiftwidth when indenting with '<'
                        " and '>'
set showmatch           " set show matching parenthesis

" Highlight whitespaces visually
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Set exception for html and xml
autocmd filetype html,xml set listchars-=tab:>.

set undolevels=1000     " use many muchos levels of undo
set title               " change the terminal's title
set visualbell          " don't beep
set noerrorbells        " don't beep


" Wildignore rules to restrict matching
"
set wildignore+=node_modules                        " node_modules folder
set wildignore+=.hg,.git,.svn                       " VCS folders
set wildignore+=*.aux,*.out,*.toc                   " Latex Indermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
                                                    " Binary Imgs
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest    " Compiled Object files
set wildignore+=*.sw?                               " Vim swap files
set wildignore+=*.DS_Store                          " OSX files
set wildignore+=*.luac                              " Lua byt code
set wildignore+=migrations                          " Django migrations
set wildignore+=*.pyc                               " Python Object codes
set wildignore+=*.orig                              " Merge resolution files


" Map cut and paste actions
vnoremap <C-c> "+y
vnoremap <C-x> "+x
vnoremap <C-v> "+gP


" autocompletion with Ctrl+space
inoremap <c-space> <c-n>
inoremap <Nul> <c-n>

" Save file as root after opening a file without root privileges
cmap w!! w !sudo tee % >/dev/null

" http://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message
autocmd Filetype gitcommit setlocal spell textwidth=72


" Splits
set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"""""""""""""""""""""""""""""""""""""""""""""""""""
"                     PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-airline plugin configuration
"
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
set laststatus=2
set noshowmode                  " hide default mode indicator
let g:airline_theme             = 'luna'
let g:airline_powerline_fonts   = 1
let g:Powerline_symbols = 'fancy'

" enable list of buffers on top
let g:airline#extensions#tabline#enabled = 1


" vim-gitgutter plugin configuration
"
let g:gitgutter_updatetime = 750


" vim-flake8 plugin configuration
"
let g:flake8_show_in_gutter = 1

" run flake8 check everytime a python file is written
autocmd BufWritePost *.py call Flake8()


" Syntastic plugin configuration
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" Toggle Tagbar
nmap <F8> :TagbarToggle<CR>

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" vim-easytags configuration
"
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""


" Buffer navigation key-bindings
nmap <leader>p :bprevious<CR>
nmap <leader>n :bnext<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Remap : to ; for easier vim commands
nnoremap ; :

" Easy toggle word wrap
map <F7> :set wrap!<cr>

