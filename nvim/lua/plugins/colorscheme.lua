return {
    "catppuccin/nvim",
    name = "cappuccin",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme "catppuccin-mocha"
    end,
}
