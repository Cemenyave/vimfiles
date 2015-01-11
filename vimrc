set nocompatible
"unmap arrows
no <up> <Nop>
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>

ino <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>

"general mapping
nmap <C-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabprevious<CR>
map <C-Tab> :tabnext<CR>
map <C-S-Tab> :tabprevious<CR>
imap <C-Tab> <Esc>:tabnext<CR>
imap <C-S-Tab> <Esc>:tabprevious<CR>

"maximize on start
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=999 columns=999
endif

"set language
set langmenu=none
set encoding=utf-8
language mes en_GB

"vaundle configure
set nocompatible
filetype off

set rtp+=$VIM\vimfiles\bundle\Vundle.vim
echo $VIM 

call vundle#begin('$VIM\vimfiles\custom_path')
Plugin 'tpope/vim-fugitive'
call vundle#end()
filetype plugin indent on

"pathogen init
execute pathogen#infect()
syntax on
filetype plugin indent on

"change the mapleader form \ to , (comma)
let mapleader = ","

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"tab settings
set smartindent
set copyindent
set smarttab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

"nonprint symbols displya
set listchars=tab:▸\ ,eol:¬
set list

"set color scheme
colorscheme skittles_berry
let g:airline_theme="dark"
set colorcolumn=80
highlight ColorColumn ctermbg=darkgray
syntax on
set guifont=Sauce_Code_Powerline:h11
let g:airline_powerline_fonts = 1

set showmatch
set ignorecase
set number
set hlsearch
set incsearch

set nobackup
set noswapfile

"use system clipboard
set clipboard=unnamed

"set similar search format for windows findstr as for defaoult vimgrap
set grepprg=findstr\ /n\ /s
"Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

set laststatus=2 "always show statusline
let g:airline#extensions#tabline#enabled = 1

"tagbar plugin
nmap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '$HOME\vimfiles\utility\ctags\ctags.exe'

"the_silver_search path for ad.vim
let g:agprg='\vimfiles\utility\the_silver_search\ag.exe --column'
let g:aghighlight=1

au BufNewFile,BufRead *.nut setf squirrel
