set nocompatible              " be iMproved, required
"filetype off                  " required see [https://github.com/VundleVim/Vundle.vim/issues/176]

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'wincent/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

"Vim-Man 'Display manual pages from vim'
Plugin 'idbrii/vim-man'

"Syntastic
Plugin 'vim-syntastic/syntastic'

"Badwolf colorscheme
Plugin 'sjl/badwolf'

"ctrlp fuzzy file searcher *cough* screw you commandt *cough*
"Plugin 'kien/ctrlp.vim'
Plugin 'ctrlpvim/ctrlp.vim'

"Vim Airline/Powerline MOTHERF**KER!!!
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"tmuxline (Because tmux is better than screen and you know it :p)
Plugin 'edkolev/tmuxline.vim'

"Nerdtree plugin
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
" "SOME CONFIGURATION FOR VIM"
"
"Colour Scheme Stuff
"--------------------------------
colorscheme badwolf
if $COLORTERM == 'gnome-terminal'
set t_Co=256
endif

"Not always needed, disabled when using badwolf colours.
"set background=dark

"=--------(END COLOUR SCHEME STUFF)-----------------

"Other configs
"--------------------------------

"--------------------------------
"Airline config"
"--------------------------------
set laststatus=2
"--------------------------------

syntax enable

"Number of space vim will display when reading a <tab> character
set tabstop=4

"Number of space vim will INSERT when <tab> is pressed
set softtabstop=4

"Convert <tab> to spaces
set expandtab

"show the last command used
set showcmd

"draw line or highlight at cursor
set cursorline

"load file specific tab control
filetype indent on 

"Enable autocompletion pane
set wildmenu

"Highlight matching parenthesis
set showmatch

"Better searching by searching whilst typing and highlighting results.
set incsearch
set hlsearch

" Ignore case whilst searching
set ignorecase

" Smart Case Search
set smartcase


"Add folding support
set foldenable
set foldlevelstart=10 "folds under 10 will be opened automatically.
set foldmethod=indent "fold on indents (indent, marker, manual, expr, syntax, diff


""Some remappings
"""""
"Set space to open and close folds
nnoremap <space> za

"Set K to :Man 
nnoremap K :Man <cword>

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

"Syntastic Settings #see help Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Language specific settings
augroup configgroup
        autocmd!
        autocmd VimEnter * highlight clear SignColumn
        autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
        \:call <SID>StripTrailingWhitespaces()
        autocmd FileType java setlocal noexpandtab
        autocmd FileType java setlocal list
        autocmd FileType java setlocal listchars=tab:+\ ,eol:-
        autocmd FileType java setlocal formatprg=par\ -w80\ -T4
        autocmd FileType php setlocal expandtab
        autocmd FileType php setlocal list
        autocmd FileType php setlocal listchars=tab:+\ ,eol:-
        autocmd FileType php setlocal formatprg=par\ -w80\ -T4
        autocmd FileType ruby setlocal tabstop=2
        autocmd FileType ruby setlocal shiftwidth=2
        autocmd FileType ruby setlocal softtabstop=2
        autocmd FileType ruby setlocal commentstring=#\ %s
        autocmd FileType python setlocal commentstring=#\ %s
        autocmd BufEnter *.cls setlocal filetype=java
        autocmd BufEnter *.zsh-theme setlocal filetype=zsh
        autocmd BufEnter Makefile setlocal noexpandtab
        autocmd BufEnter *.sh setlocal tabstop=2
        autocmd BufEnter *.sh setlocal shiftwidth=2
        autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

