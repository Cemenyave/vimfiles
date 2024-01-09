--init.lua
--let &rtp.=',~/vimfiles'
--source ~/vimfiles/init.lua
--
--
--vim.opt.rtp:append { ',D:/vimfiles/' }
-- require('D:/vimfiles/init.lua')-

require('config/core')
require('config/main')
require('config/plugins')
require('config/lsp')

vim.opt.background = "dark"
vim.cmd [[colorscheme monokai]]
vim.g.solarized_termcolors = 16

--Rg shortcuts binding
vim.keymap.set({'n'}, '<leader>F', ':Rg ')
--Unitl will fix asunc calls
vim.g.rg_run_async = 0

--Regin uxapnding bindings for vim-expand-region
vim.keymap.set({'v'}, 'v', '<Plug>(expand_region_expand)')
vim.keymap.set({'v'}, '<C-v>', '<Plug>(expand_region_shrink)')

vim.g.completion_enable_auto_popup = 0
vim.opt.completeopt = { menu, menuone, noselect }

local cmp = require'cmp'
local cmp_types = require('cmp.types')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-j>'] = { i = cmp.mapping.select_next_item({behavior = cmp_types.cmp.SelectBehavior.Select }) },
    ['<C-k>'] = { i = cmp.mapping.select_prev_item({behavior = cmp_types.cmp.SelectBehavior.Select }) },
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, 
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(), 
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ serlect = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }
  })
})

require('fidget').setup{}
require('trouble').setup{}
require('lsp-status').register_progress()
