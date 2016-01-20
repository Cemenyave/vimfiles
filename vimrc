if has('win32')
  let s:vim_cache = expand('$HOME/vimfiles/')
else
  let s:vim_cache = expand('$HOME/.vim/')
endif

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
nmap <C-Tab> :bn<CR>
nmap <C-S-Tab> :bp<CR>
map <C-Tab> :bn<CR>
map <C-S-Tab> :bp<CR>
imap <C-Tab> <Esc>:bn<CR>
imap <C-S-Tab> <Esc>:bp<CR>

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

let &rtp.=','.s:vim_cache . 'bundle/Vundle.vim'
call vundle#begin(s:vim_cache . 'vundle_plugin')
"lib
Plugin 'vim-scripts/L9'

"Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

"navigation & search
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'

"text processing
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-expand-region'

Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'

"decoration
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'

"Plugin 'Shougo/vimproc.vim'
"Plugin 'Shougo/unite.vim'
call vundle#end()
filetype plugin indent on

"change the mapleader form \ to spacebar (comma)
let mapleader = "\<Space>"

nmap <silent> <leader>ev :e $HOME/vimfiles/vimrc<CR>
nmap <silent> <leader>sv :so $HOME/vimfiles/vimrc<CR>

"Copy & paste to system clipboard with <Space>p and <Space>y:
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"tab settings
set smartindent
set copyindent
set smarttab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

"nonprint symbols display
set listchars=tab:▸\ ,eol:¬
set list

"Airline settings
let g:airline_theme="solarized"
highlight ColorColumn ctermbg=darkgray

"set color scheme
syntax enable
if !has("gui_running")
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
endif
let g:solarized_termcolors=16
set background=dark
colorscheme solarized


set colorcolumn=80

set showmatch
set ignorecase
set number
set hlsearch
set incsearch

set nobackup
set noswapfile

"use system clipboard
set clipboard=unnamed

"set similar search format for windows findstr as for defaoult vimgrep
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

"the_silver_search path for ag.vim
let g:ag_prg=$HOME . '\vimfiles\utility\the_silver_search\ag.exe --column'
let g:aghighlight=1

"Ag shortcuts binding
nmap <leader>f :Ag 

"Regin uxapnding bindings for vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"CtrlP configuration
nmap <leader>t :CtrlP<CR>

au BufNewFile,BufRead *.nut setf squirrel

"Disable beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set noeb vb t_vb=
au GUIEnter * set vb t_vb=
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

