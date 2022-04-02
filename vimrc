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

" fsync on windows might be slow
if has('win32')
	set nofsync
endif

"maximize on start
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=999 columns=999
endif

"set language
set langmenu=none
set encoding=utf-8
if has('win32')
  language mes en_GB
else
  language mes en_US.utf8
endif

let isWsl = 0
let uname = substitute(system('uname'),'\n','','')
if uname == 'Linux'
  let lines = readfile("/proc/version")
  if lines[0] =~ "Microsoft"
    let isWsl = 1
  endif
endif

"vaundle configure
set nocompatible
filetype off

"add vim-plug to runtime path
let &rtp.=','.s:vim_cache . 'bundle/vim-plug'
call plug#begin(s:vim_cache . 'vim-plug')

"Utils
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'

"lua
Plug 'rafcamlet/nvim-luapad'

"Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'nfvs/vim-perforce'

"navigation & search
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-eunuch'
Plug 'vijaymarupudi/nvim-fzf'
Plug 'vijaymarupudi/nvim-fzf-commands'
Plug 'nvim-telescope/telescope.nvim'
Plug 'duane9/nvim-rg'

"text processing
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-expand-region'

"IDE
"Plug 'scrooloose/syntastic'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'j-hui/fidget.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'embear/vim-localvimrc'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'

"decoration
"Plug 'bling/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
Plug 'tanvirtin/monokai.nvim'
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
set listchars=tab:▸\ ,eol:↩
set list

"Airline settings
"let g:airline_theme="dark"
"highlight ColorColumn ctermbg=darkgray

"if !exists('g:airline_symbols')
  "let g:airline_symbols = {}
"endif

"let g:airline_left_alt_sep = ''
"let g:airline_left_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_symbols.colnr = ' :'
"let g:airline_symbols.crypt = ''
"let g:airline_symbols.linenr = ' :'
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.spell = 'spll'
"let g:airline_symbols.notexists = '∄'
"let g:airline_symbols.whitespace = 'Ξ'
"let g:airline_symbols.dirty = '⋆'
"let g:airline_symbols.readonly = ''
""end airline

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
"colorscheme solarized8
colorscheme monokai


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
let rg_run_async = 0 "Unitl will fix asunc calls

"Regin uxapnding bindings for vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"Fzf configuration
nmap <leader>t <cmd>lua require("fzf-commands").files()<CR>
nmap <leader>tb <cmd>lua require("fzf-commands").bufferpicker()<CR>

nmap <leader>T <cmd>lua require("telescope.builtin").find_files()<CR>


" Allow passing optional flags into the Rg command.
"   Example: :Rg myterm -g '*.md'
"command! -bang -nargs=* Rg
  "\ call fzf#vim#grep(
  "\ "rg --column --line-number --no-heading --color=always --smart-case " .
  "\ <q-args>, 1, fzf#vim#with_preview(), <bang>0)

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

if isWsl
  let g:vim_perforce_executable = 'p4.exe'
  let g:perforce_use_cygpath = 1
endif


let g:completion_enable_auto_popup = 0

set completeopt=menu,menuone,noselect

lua << EOF

require'lualine'.setup({
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
})

--[[
require('lspconfig').clangd.setup({
  on_attach=require'completion'.on_attach,
  cmd = { "clangd-13", "--background-index" }
})
--]]

local lsp_status = require('lps_status')

require"fidget".setup{}

local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  mappind = {
    ['<C-j>'] = cmp.mapping.select_next_item,
    ['<C-k>'] = cmp.mapping.select_prev_item,
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, 
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(), 
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ serlect = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }
  })
})

local lsp_installer = require("nvim-lsp-installer")

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>g', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = on_attach,
      capabilities = capabilities,
      flags = {
        -- This will be the default in neovim 0.7+
        debounce_text_changes = 150,
      }
    }

    if server.name == "omnisharp" then
      local pid = vim.fn.getpid()
      -- opts.cmd = { "omnisharp", "--languageserver" , "--hostPID", tostring(pid) }
    end

    server:setup(opts)
end)

lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})


require('telescope').setup({
  defaults = {
    },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    }
})
EOF

"runtime .vimrc_coc
