" Map Colemak keys in alphabetical order.
"noremap d g
"noremap e k
"noremap f e
"noremap g t
"noremap i l
"noremap j y
"noremap k n
"noremap l u
"noremap n j
"noremap o p
"noremap p r
"noremap r s
"noremap s d
"noremap t f
"noremap u i
"noremap y o
"noremap D G
"noremap E K
"noremap F E
"noremap G T
"noremap I L
"noremap J Y
"noremap K N
"noremap L U
"noremap N J
"noremap O P
"noremap P R
"noremap R S
"noremap S D
"noremap T F
"noremap U I
"noremap Y O

" Colemak bindings
set langmap=dg,ek,fe,gt,il,jy,kn,lu,nj,pr,rs,sd,tf,ui,yo,op,DG,EK,FE,GT,IL,JY,KN,LU,NJ,PR,RS,SD,TF,UI,YO,OP

" =====[PLUGIN MANAGER STUFF]=======

" Directory for plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'preservim/nerdtree'
" Plug 'jdhao/better-escape.vim'
Plug 'zhou13/vim-easyescape'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'arcticicestudio/nord-vim'
Plug 'ycm-core/YouCompleteMe'
" Plug 'dracula/vim', { 'as': 'dracula' }

" Initialize plugin system
call plug#end()

" =====[MAP CUSTOM KEYS]=======

" So, because the way neovim does keymappings, mapping 'ne' explicitly actually does this: it detects the press of 'n' and then when you press 'e', it treats it as 'k', because we are no longer in insert mode and 'e' is mapped to 'k' because of colemak mappings. To prevent this, we simply map 'nk'
"inoremap nk <esc>
"inoremap ej <esc>

noremap ; :

noremap <cr> :w\|!make debug<cr>
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

"let g:better_escape_shortcut = ['fp', 'pf']
"let g:better_escape_interval = 80
let g:easyescape_chars = { "f": 1, "p": 1 }
let g:easyescape_timeout = 80

" Map escape to the weird keybind that terminal mode uses (now you can exit terminal without tears)
tnoremap <esc> <C-\><C-n>

" ---------------------------------------------
 

" Use a good color scheme.
colorscheme nord

" Set AirLine
let g:airline_theme='deus'
set t_Co=256
let g:airline_powerline_fonts = 1

" Enable syntax highlighting.
syntax on

" Enable plugins and indentation for specific file types.
filetype plugin indent on

" Use space as the leader key. Some articles such as https://bit.ly/2on9Qlu
" advocate for setting a local leader rather than limiting a map to a buffer.
" I've decided against doing that since I don't run any plugins and don't need
" the additional complexity.
" let mapleader = " "

" Store temporary files in .vim to keep the working directories clean.
"set directory=~/.vim/swap
"set undodir=~/.vim/undo

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

