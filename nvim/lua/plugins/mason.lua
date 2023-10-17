return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
        local lspconfig = require("mason-lspconfig")
        lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "tsserver",
                "html",
                "cssls",
                "gopls"
            },
            automatic_installation = true,
        })
    end,
}
