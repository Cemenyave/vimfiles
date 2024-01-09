
-- Table stores required plugins
-- {
--    name - plugin repo name
--    options - options table for vim Plug
--    config - name of the local config lua script
-- }
local Plugins = {}
local C = {}

function C.Plugin(plugin)
  if type(plugin) == "string" then
    table.insert(Plugins, { name = plugin })
  elseif type(plugin) == "table" then
    table.insert(Plugins, plugin)
  end
end

function C.LoadPlugins()

  local Plug = vim.fn['plug#']

  -- Load all plugins with vim Plug
  vim.call( 'plug#begin', vim.g.vim_cache .. 'vim-plug')

  for _, plug in pairs(Plugins) do
    if plug["options"] ~= nil then
      Plug(plug.name, plug.options)
    else
      Plug(plug.name)
    end
  end
  vim.call('plug#end')

  -- Run config scirpts
  for _, plug in pairs(Plugins) do
    if plug["config"] ~= nil then
      if type(plug.config) == "function" then
        plugin.config()
      else
        require('config/plugins/'..plug.config)
      end
    end
  end

  -- Clear plugins at the end
  Plugins = {}
end

return C
