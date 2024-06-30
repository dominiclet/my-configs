return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
        local lspconfig = require("mason-lspconfig")
        require('lsp-zero').extend_lspconfig()
        lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "tsserver",
                "html",
                "cssls",
                "gopls"
            },
            automatic_installation = true,
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
            }
        })
    end,
}
