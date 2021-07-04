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

"switch between tabs with Ctrl-Tab and Shift-Ctrl-Tab
"Disabled because I'm not using this and it might confilict with coc.vim
"configuration
"nmap <C-Tab> :bn<CR>
"nmap <C-S-Tab> :bp<CR>
"map <C-Tab> :bn<CR>
"map <C-S-Tab> :bp<CR>
"imap <C-Tab> <Esc>:bn<CR>
"imap <C-S-Tab> <Esc>:bp<CR>

inoremap <Char-0x07F> <BS>
nnoremap <Char-0x07F> <BS>

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

"add vim-plug to runtime path
let &rtp.=','.s:vim_cache . 'bundle/vim-plug'
call plug#begin(s:vim_cache . 'vim-plug')

"Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'nfvs/vim-perforce'

"navigation & search
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-eunuch'
Plug 'junegunn/fzf', { 'do':{ -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"text processing
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-expand-region'

"IDE
Plug 'scrooloose/syntastic'
Plug 'neoclide/coc.nvim'
Plug 'embear/vim-localvimrc'

"decoration
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
Plug 'vim-scripts/AfterColors.vim'

"Plugin 'Shougo/vimproc.vim'
"Plugin 'Shougo/unite.vim'
call plug#end()
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
if !has("gui_running") && !has("nvim")
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
endif
let g:solarized_termcolors=16
set background=dark
colorscheme solarized8


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

"Rg shortcuts binding
nmap <leader>f :Rg 

"Regin uxapnding bindings for vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"Fzf configuration
nmap <leader>t :Files<CR>
nmap <leader>tb :Buffers<CR>


" Allow passing optional flags into the Rg command.
"   Example: :Rg myterm -g '*.md'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ "rg --column --line-number --no-heading --color=always --smart-case " .
  \ <q-args>, 1, fzf#vim#with_preview(), <bang>0)

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

runtime .vimrc_coc
