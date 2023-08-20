-- Disable pair tree for telescope (fix enter not selecting in insert mode)
-- https://github.com/nvim-telescope/telescope.nvim/wiki/Troubleshoot
vim.cmd[[
let g:pear_tree_ft_disabled = ["TelescopePrompt"]
]]

local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-d>"] = actions.delete_buffer
      },
    },
  }
}
