return {
    'stevearc/oil.nvim',
    opts = {},
    config = function()
        require("oil").setup()
        vim.keymap.set('n', '<leader>o', '<cmd>Oil<cr>')
    end
}
