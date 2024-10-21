return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set('n', '<leader>gb', '<cmd>:G blame<CR>')
    end
}
