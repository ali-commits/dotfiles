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

" look and feel
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'

"usability
Plug 'easymotion/vim-easymotion' 
Plug 'scrooloose/nerdtree'
"Plug 'mattn/emmet-vim'
"Plug 'jiangmiao/auto-pairs'

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
let mapleader = " "


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


" Lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status'
      \ },
      \ 'colorscheme': 'codedark',
      \ }

function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  _  __          __  __             
" | |/ /___ _   _|  \/  | __ _ _ __  
" | ' // _ \ | | | |\/| |/ _` | '_ \ 
" | . \  __/ |_| | |  | | (_| | |_) |
" |_|\_\___|\__, |_|  |_|\__,_| .__/ 
"           |___/             |_|   
"keymap

map <C-n> :NERDTreeToggle<CR>
map <C-m> :set nu! relativenumber!<CR>
map ;; <ESC>
inoremap ;; <ESC><ESC>
nmap ;z :q<CR>
map ;w :w<CR>

nnoremap J 0
nnoremap K $
" moving between vim windows
map <C-j> <C-w>j
map <C-h> <C-w>h
map <C-k> <C-w>k
map <C-l> <C-w>l

