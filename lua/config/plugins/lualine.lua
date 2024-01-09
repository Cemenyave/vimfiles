-- Show S letter when there is and active snippet on current line
local ls = require('luasnip')
local snipet = function()
  if ls.in_snippet() then
    return "S"
  else
    return ''
  end
end

require'lualine'.setup({
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename', snipet},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
})
