return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set('n', '<leader>gg', '<cmd>tab :G<CR>')
        vim.keymap.set('n', '<leader>gl', '<cmd>tab :G log<CR>')
        vim.keymap.set('n', '<leader>gb', '<cmd>:G blame<CR>')
    end
}
