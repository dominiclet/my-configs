return {
    'stevearc/oil.nvim',
    opts = {},
    config = function()
        require("oil").setup()
        vim.keymap.set('n', '<leader>fo', '<cmd>Oil<cr>')
    end
}
