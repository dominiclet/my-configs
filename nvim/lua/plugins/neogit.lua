return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",         -- required

        -- Only one of these is needed.
        "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
        local neogit = require('neogit')
        neogit.setup {}
        vim.keymap.set('n', '<leader>gg', '<cmd>:Neogit<CR>')
    end
}

