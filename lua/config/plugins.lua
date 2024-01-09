local C = require('config/core')

C.Plugin('nvim-lua/plenary.nvim')

C.Plugin({
  name = 'nvim-treesitter/nvim-treesitter',
  options = { ['do'] = ':TSUpdate' },
  config = 'treesitter',
})
C.Plugin('nvim-treesitter/playground')

--lua
C.Plugin('rafcamlet/nvim-luapad')

--OpenGL
C.Plugin('tikhomirov/vim-glsl')

--Git
C.Plugin('tpope/vim-fugitive')
C.Plugin('airblade/vim-gitgutter')
C.Plugin('nfvs/vim-perforce')

--navigation & search
C.Plugin('scrooloose/nerdtree')
C.Plugin('tpope/vim-eunuch')
C.Plugin('vijaymarupudi/nvim-fzf')
C.Plugin('vijaymarupudi/nvim-fzf-commands')

C.Plugin({
  name = 'nvim-telescope/telescope.nvim',
  config = 'telescope'
})

C.Plugin('duane9/nvim-rg')

--text processing
C.Plugin('scrooloose/nerdcommenter')
C.Plugin('terryma/vim-expand-region')

--IDE
C.Plugin({
  name = 'dense-analysis/ale',
  config = 'ale'
})

C.Plugin({
  name = 'williamboman/mason.nvim',
  config = 'mason'
})
C.Plugin({
  name = 'williamboman/mason-lspconfig.nvim',
  config = 'mason-lspconfig'
})
C.Plugin('neovim/nvim-lspconfig')
C.Plugin('nvim-lua/lsp-status.nvim')
C.Plugin('j-hui/fidget.nvim')
C.Plugin('nvim-lua/completion-nvim')
C.Plugin('embear/vim-localvimrc')
C.Plugin({
  name = 'L3MON4D3/LuaSnip',
  config = 'LuaSnip'
})
C.Plugin('hrsh7th/nvim-cmp')
C.Plugin('saadparwaiz1/cmp_luasnip')
C.Plugin('hrsh7th/cmp-nvim-lsp')
C.Plugin('kyazdani42/nvim-web-devicons')
C.Plugin('folke/trouble.nvim')
C.Plugin('RishabhRD/popfix')
C.Plugin('RishabhRD/nvim-lsputils')
C.Plugin('jubnzv/virtual-types.nvim')
C.Plugin({
  name = 'ThePrimeagen/harpoon',
  config = 'harpoon',
})

--decoration
--C.Plugin 'bling/vim-airline')
--C.Plugin 'vim-airline/vim-airline-themes')
C.Plugin({
  name = 'nvim-lualine/lualine.nvim',
  config = 'lualine',
})
C.Plugin('kyazdani42/nvim-web-devicons')
C.Plugin('altercation/vim-colors-solarized')
C.Plugin('lifepillar/vim-solarized8')
C.Plugin('tanvirtin/monokai.nvim')
C.Plugin('vim-scripts/AfterColors.vim')

--C.Plugin('Shougo/vimproc.vim')
--C.Plugin('Shougo/unite.vim')



C.LoadPlugins()
