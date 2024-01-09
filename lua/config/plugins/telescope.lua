local telescope = require('telescope')

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      },
    },
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

function P(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, "plenary") then
  RELOAD = require("plenary.reload").reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end

function reload()
  -- Telescope will give us something like ju/colors.lua,
  -- so this function convert the selected entry to
  -- the module name: ju.colors
  local function get_module_name(s)
    local module_name;

    module_name = s:gsub("%.lua", "")
    module_name = module_name:gsub("%/", ".")
    module_name = module_name:gsub("%.init", "")

    return module_name
  end

  local prompt_title = "~ neovim modules ~"

  -- sets the path to the lua folder
  local path = "~/.config/nvim/lua"

  local opts = {
    prompt_title = prompt_title,
    cwd = path,

    attach_mappings = function(_, map)
     -- Adds a new map to ctrl+e.
      map({'i', 'n'}, '<C-e>', function(_)
        -- these two a very self-explanatory
        local entry = require("telescope.actions.state").get_selected_entry()
        local name = get_module_name(entry.value)

        print(name)

        -- call the helper method to reload the module
        -- and give some feedback
        R(name)
        P(name .. " RELOADED!!!")
      end)

      return true
    end
  }

  -- call the builtin method to list files
  require('telescope.builtin').find_files(opts)
end

-- List config files and reload selected with <C-e>
vim.keymap.set('n', '<leader>qq', function() reload() end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>t',  function() require("telescope.builtin").find_files() end )
vim.keymap.set('n', '<leader>f',  function() require("telescope.builtin").live_grep() end )
vim.keymap.set('n', '<leader>Fc',  function() require("telescope.builtin").live_grep(
  {
    glob_pattern = '*.{c,cpp,h}'
  }
) end )
vim.keymap.set('n', '<leader>O', function() require("telescope.builtin").lsp_workspace_symbols() end)
