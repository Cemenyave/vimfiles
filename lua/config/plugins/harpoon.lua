-- Harpoon keybindings
vim.keymap.set("n", "<leader>y",  function() require("harpoon.ui").toggle_quick_menu() end, {noremap=true, silent=true} )
vim.keymap.set("n", "<leader>hh", function() require("harpoon.mark").add_file() end,        {noremap=true, silent=true} )

require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
    }
})
