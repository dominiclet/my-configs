return {
    "lewis6991/gitsigns.nvim",
    config = function()
        local gitsigns = require('gitsigns')
        gitsigns.setup()
        vim.keymap.set('n', '<leader>gb', '<cmd>Gitsigns blame<CR>')
    end
}
