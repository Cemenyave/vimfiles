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

set rtp+=$HOME\vimfiles\bundle\Vundle.vim
call vundle#begin('$HOME\vimfiles\vundle_plugin')
Plugin 'vim-scripts/L9'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-expand-region'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'rking/ag.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
call vundle#end()
filetype plugin indent on

"change the mapleader form \ to spacebar (comma)
let mapleader = "\<Space>"

nmap <silent> <leader>ev :e $HOME\vimfiles\vimrc<CR>
nmap <silent> <leader>sv :so $HOME\vimfiles\vimrc<CR>

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

"Regin uxapnding bindings for vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"Unite configuration
let g:unite_split_rule = 'botright'
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10
let g:unite_candidate_icon='▷'

" Using ag as recursive command.
let g:unite_source_rec_async_command =
    \ 'ag --follow --nocolor --nogroup --hidden -g ""'
  " files
nnoremap <silent><Leader>o :Unite -silent -start-insert file<CR>
nnoremap <silent><Leader>O :Unite -silent -start-insert file_rec/async<CR>
nnoremap <silent><Leader>m :Unite -silent file_mru<CR>
  " buffers
nnoremap <silent><Leader>b :Unite -silent buffer<CR>
  " tabs
nnoremap <silent><Leader>B :Unite -silent tab<CR>
  " buffer search
nnoremap <silent><Leader>f :Unite -silent -no-split -start-insert -auto-preview
            \ line<CR>
nnoremap <silent>[menu]8 :UniteWithCursorWord -silent -no-split -auto-preview
            \ line<CR>
  " yankring
nnoremap <silent><Leader>i :Unite -silent history/yank<CR>
  " grep
nnoremap <silent><Leader>a :Unite -silent -no-quit grep<CR>
  " help
nnoremap <silent> g<C-h> :UniteWithCursorWord -silent help<CR>
  " tasks
nnoremap <silent><Leader>; :Unite -silent -toggle
            \ Ag:%::FIXME\|TODO\|NOTE\|XXX\|COMBAK\|@todo<CR>
  " outlines (also ctags)
nnoremap <silent><Leader>t :Unite -silent -vertical -winwidth=40
            \ -direction=topleft -toggle outline<CR>
  " junk files
  nnoremap <silent><Leader>d :Unite -silent junkfile/new junkfile<CR>
au BufNewFile,BufRead *.nut setf squirrel
