return {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip"
    },
    config = function()
        local lsp_zero = require('lsp-zero')
        lsp_zero.extend_lspconfig()
        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({buffer = bufnr})

            vim.keymap.set({'n', 'i'}, '<C-l>', vim.lsp.buf.signature_help, {buffer = bufnr})
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {buffer = bufnr})
            vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, {buffer = bufnr})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {buffer = bufnr})
        end)

        local cmp = require('cmp')
        local cmp_format = require('lsp-zero').cmp_format({details = true})
        cmp.setup({
            sources = {
                {name = 'nvim_lsp'},
                {name = 'buffer'},
                {name = 'orgmode'}
            },
            formatting = cmp_format,
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ['<C-k>'] = cmp.mapping.select_prev_item(),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<C-l>'] = cmp.mapping.confirm({ select = true }),
            })
        })
        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            })
        })

        lsp_zero.format_on_save({
            format_opts = {
                async = false,
                timeout_ms = 10000,
            },
            servers = {
                ['gopls'] = {'go'}
            }
        })
    end
}
