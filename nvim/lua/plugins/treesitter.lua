return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        local treesitter = require('nvim-treesitter.config')

        treesitter.setup({
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
                disable = {"python", "ocaml" },
            }
        })
    end,
}
