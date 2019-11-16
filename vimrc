"vim plugins using vim-plug"install vim-plug if it is not downloaded
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  ____  _             _
" |  _ \| |_   _  __ _(_)_ __  ___
" | |_) | | | | |/ _` | | '_ \/ __|
" |  __/| | |_| | (_| | | | | \__ \
" |_|   |_|\__,_|\__, |_|_| |_|___/
"                |___/
"plugin

call plug#begin('~/.vim/plugged')
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion' 
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   ____             __ _
"  / ___|___  _ __  / _(_) __ _
" | |   / _ \| '_ \| |_| |/ _` |
" | |__| (_) | | | |  _| | (_| |
"  \____\___/|_| |_|_| |_|\__, |
"                         |___/
"config

set number relativenumber
set wildmode=longest,list,full
set splitbelow splitright
set encoding=utf-8
set tabstop=4

"change cursor based on mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\" "Insert mode  : line
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\" "Replace mode : underline
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\" "Normal mode  : block
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" "Insert mode  : line
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" "Normal mode  : block
  let &t_SR = "\<Esc>]50;CursorShape=2\x7" "Replace mode : underline 
endif
" set cursor to blinking block on start
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[1 q"
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  _  __          __  __             
" | |/ /___ _   _|  \/  | __ _ _ __  
" | ' // _ \ | | | |\/| |/ _` | '_ \ 
" | . \  __/ |_| | |  | | (_| | |_) |
" |_|\_\___|\__, |_|  |_|\__,_| .__/ 
"           |___/             |_|   
"keymap

nnoremap gy :Goyo<CR>  
map <C-n> :NERDTreeToggle<CR>
map mm :set nu! relativenumber!<CR>
map mn :set relativenumber!<CR>
map ;; <ESC>
inoremap ;; <ESC><ESC>
nmap ;; :q<CR>
map ;z :wq<CR>

nnoremap J 0
nnoremap K $
" moving between vim windows
map <C-j> <C-w>j
map <C-h> <C-w>h
map <C-k> <C-w>k
map <C-l> <C-w>l

