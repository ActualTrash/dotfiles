" Colemak bindings
set langmap=dg,ek,fe,gt,il,jy,kn,lu,nj,pr,rs,sd,tf,ui,yo,op,DG,EK,FE,GT,IL,JY,KN,LU,NJ,PR,RS,SD,TF,UI,YO,OP

" =====[PLUGIN MANAGER STUFF]=======

" Directory for plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'preservim/nerdtree'
Plug 'zhou13/vim-easyescape'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-surround'
"Plug 'ycm-core/YouCompleteMe'
Plug 'dag/vim-fish' " Adds syntaxs highlighting for fish scripts
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'dracula/vim'
"Plug 'hashivim/vim-terraform'
Plug 'sickill/vim-monokai'
Plug 'phanviet/vim-monokai-pro'

" Initialize plugin system
call plug#end()

" =====[MAP CUSTOM KEYS]=======

" Why isn't this the default lol
noremap ; :

" Fix page movement keybinds
noremap <C-n> <C-e>
noremap <C-e> <C-y>

" noremap <cr> :w\|!make debug<cr>
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

let g:easyescape_chars = { "f": 1, "p": 1 }
let g:easyescape_timeout = 80

" Map escape to the weird keybind that terminal mode uses (now you can exit terminal without tears)
tnoremap <esc> <C-\><C-n>

" ---------------------------------------------

" Use a good color scheme.
set termguicolors
colorscheme monokai_pro

" Enable syntax highlighting.
syntax on

" Set AirLine
""let g:airline_theme='deus'
"let g:airline_theme='angr'
"set t_Co=256
"let g:airline_powerline_fonts = 1

" Set lightline
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'component': {
    \     'cocstatus': '%{coc#status()}',
    \     'charhexvalue': '0x%B',
    \     'gitbranch': ' %{fugitive#head()}'
    \ },
    \ 'active': {
    \   'left': [
    \            ['mode', 'paste'],
    \            [ 'readonly', 'gitbranch-raw', 'filename', 'modified']
    \         ],
    \   'righta': [
    \            ['charhexvalue']
    \   ]
    \     },
    \ 'component_function': { 'gitbranch-raw': 'fugitive#head' }
    \ }

" Enable plugins and indentation for specific file types.
filetype plugin indent on

" Use space as the leader key. Some articles such as https://bit.ly/2on9Qlu
" advocate for setting a local leader rather than limiting a map to a buffer.
" I've decided against doing that since I don't run any plugins and don't need
" the additional complexity.
" let mapleader = " "

" Set tab width to four spaces
set expandtab
set shiftwidth=4

" Enable mouse support.
set mouse=a

" Enable persistent undo.
set undofile

" Use incremental search and highlight as we go.
set hlsearch
set incsearch

" Search should be case insensitive unless containing uppercase characters.
set ignorecase
set smartcase

" Show line numbers as relative so relative navigation is easier. Show actual
" line number for active line.
set relativenumber
set number

" Show line and character number in lower right hand corner.
set ruler

"function Fun()
"       let h = system("kill -9 $(ps -aef | grep iTerm | cut -f 3 -w)")
"endfunction

" Set the main vim clipboard to be the same as the host operating system
set clipboard=unnamed

" YouCompleteMe Setup
" set completeopt-=preview " Remove the annoying popup window

" Set up coc to use tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" From the vim video
filetype plugin on
" Search into subdirectories for files with tab completion
set path+=**
" Display all matching files when autocompleting
set wildmenu
" call Fun()
