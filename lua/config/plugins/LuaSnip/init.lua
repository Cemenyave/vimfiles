local ls = require('luasnip')

require('luasnip.loaders.from_lua').load({paths = '~/.config/nvim/snippets'})
vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]]) 

ls.config.set_config({
  history = true, -- keep around last snippet local to jump back
  updateevents = "TextChanged,TextChangedI", -- update changes as you type (when using function ...)
  enable_autosnippets = true,
  delete_check_events = "TextChanged",
  ext_base_prio = 300,
  ext_prio_increase = 1,
  ext_opts = {
    [require('luasnip.util.types').choiceNode] = {
      active = {
        virt_text = { {"●", "GruvboxOrange"} },
      },
    },
  },
})


vim.keymap.set({'i', 's'}, '<C-p>', function()
  if ls.expand_or_jumpable() then
    ls.expand()
  end
end)

vim.keymap.set({'i', 's'}, '<A-j>', function()
  if ls.jumpable(1) then
    ls.jump(1)
  end
end)
vim.keymap.set({'i', 's'}, '<A-k>', function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end)

vim.keymap.set({'i', 's'}, '<C-j>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set({'i', 's'}, '<C-k>', function()
  if ls.choice_active() then
    ls.change_choice(-1)
  end
end)

vim.keymap.set( {'n'}, '<leader><cr>', '<cmd>LuaSnipEdit<cr>', {silent = true, noremap = true })
vim.cmd([[autocmd BufEnter */snippets/*.lua nnoremap <silent> <buffer> <CR> /-- End Refactoring --<CR>O<Esc>O]])
