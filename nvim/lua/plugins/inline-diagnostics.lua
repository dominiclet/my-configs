return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
        require("tiny-inline-diagnostic").setup({
            options = {
                multilines = {
                    enabled = true,
                    always_show = true, -- <--- Keeps them visible on all lines
                    -- Choose which severities stay always on:
                    severity = {
                        vim.diagnostic.severity.ERROR,
                        vim.diagnostic.severity.WARN,
                        vim.diagnostic.severity.INFO,
                        vim.diagnostic.severity.HINT,
                    },
                },
            },
        })
        vim.diagnostic.config({ virtual_text = false }) -- Disable default virtual text
    end
}
