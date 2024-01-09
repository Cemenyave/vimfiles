local ls = require("luasnip") --{{{
local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {} --}}}

local group = vim.api.nvim_create_augroup("Lua Snippets", { clear = true })
local file_pattern = "*.lua"

local function cs(trigger, nodes, opts) --{{{
local snippet = s(trigger, nodes)
local target_table = snippets

local pattern = file_pattern
local keymaps = {}

if opts ~= nil then
  -- check for custom pattern
  if opts.pattern then
    pattern = opts.pattern
  end

  -- if opts is a string
  if type(opts) == "string" then
    if opts == "auto" then
      target_table = autosnippets
    else
      table.insert(keymaps, { "i", opts })
    end
  end

  -- if opts is a table
  if opts ~= nil and type(opts) == "table" then
    for _, keymap in ipairs(opts) do
      if type(keymap) == "string" then
        table.insert(keymaps, { "i", keymap })
      else
        table.insert(keymaps, keymap)
      end
    end
  end

  -- set autocmd for each keymap
  if opts ~= "auto" then
    for _, keymap in ipairs(keymaps) do
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = pattern,
        group = group,
        callback = function()
          vim.keymap.set(keymap[1], keymap[2], function()
            ls.snip_expand(snippet)
          end, { noremap = true, silent = true, buffer = true })
        end,
      })
    end
  end
end

table.insert(target_table, snippet) -- insert snippet into appropriate table
end --}}}

-- Start Refactoring --
local ifsnippet = s("if", fmt([[
  if ({})
  {{
    {}
  }}
]],
  {
    c(1, {
      i(1, "condition"),
      sn(1, {
        i(1, "pointerVar"),
        t(" == nullptr"),
      }),
    }),
    i(2, "// Do the thing"),
  })
)
table.insert(snippets, ifsnippet)

local nullptr = s({ trig = "np", auto = true }, {
  t"nullptr",
})
table.insert(snippets, nullptr)

local eu_ufunction = s( "ufun", fmt([[
UFUNCTION({})
{} {}({});
]],
	{
		i(1, ""),
		i(2, "void"),
		i(3, "FunctionName"),
		i(4,"")
	})
)
table.insert(snippets, eu_ufunction)

-- TODO detect API export macro automaticly
local ue_uclass = s("uclass", fmt([[UCLASS({})
class SPACECOFFEE_API {}
{{
	GENERATED_BODY()
public:
	{}
}};]], {
	i(1),
	i(2, "ClassName"),
	i(3),
}))
table.insert(snippets, ue_uclass)

-- End Refactoring --

return snippets, autosnippets
