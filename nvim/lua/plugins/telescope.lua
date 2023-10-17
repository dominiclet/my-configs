return {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        -- Disable pear tree
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

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<C-p>', builtin.find_files, {})
        vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
        vim.keymap.set('n', '<C-b>', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end,
}
