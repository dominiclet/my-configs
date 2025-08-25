return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "saghen/blink.cmp"
    },
    config = function()
        -- buffer-local keybinds when there is an active language server
        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
                if client.server_capabilities.inlayHintProvider then
                    vim.lsp.inlay_hint.enable(true)
                end

                local opts = { buffer = event.buf }

                vim.keymap.set('n', 'K', function ()
                    vim.lsp.buf.hover({ border = 'single' })
                end, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set({ 'n', 'i' }, '<C-l>', function ()
                    vim.lsp.buf.signature_help({ border = 'single' })
                end, opts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format, opts)
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
            end
        })

        -- LSP

        -- Capabilities
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT'
                    },
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    workspace = {
                        library = {
                            vim.env.VIMRUNTIME,
                        }
                    }
                }
            },
        })

        vim.lsp.config("gopls", { capabilities = capabilities })
        vim.lsp.config("ts_ls", { capabilities = capabilities })
        vim.lsp.config("rust_analyzer", { capabilities = capabilities })


        vim.lsp.enable("lua_ls")
        vim.lsp.enable('gopls')
        vim.lsp.enable('ts_ls')
        vim.lsp.enable('rust_analyzer')

        vim.diagnostic.config({
            virtual_text = true,
            underline = true
        })
    end
}
