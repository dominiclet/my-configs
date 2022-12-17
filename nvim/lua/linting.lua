null_ls = require('null-ls')

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.pycodestyle.with({
            diagnostics_postprocess = function(diagnostic)
                diagnostic.severity = vim.diagnostic.severity.WARN
            end,
            diagnostic_config = {
                virtual_text = false,
                underline = true,
            },
        }),
        null_ls.builtins.formatting.autopep8.with({
            extra_args = { "--select=W391,W2,E20,E211,E22,E224,E241,E251,E252,E26,E265,E266,E27" },
        })
    },
    fallback_severity = vim.diagnostic.severity.WARN,
    -- on_attach = function(client, bufnr)
    --     if client.supports_method("textDocument/formatting") then
    --         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    --         vim.api.nvim_create_autocmd("BufWritePre", {
    --             group = augroup,
    --             buffer = bufnr,
    --             callback = function()
    --                 -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
    --                 vim.lsp.buf.formatting_sync()
    --             end,
    --         })
    --     end
    -- end,
})

