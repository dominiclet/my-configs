return {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
        -- Setup orgmode
        require('orgmode').setup({
            org_agenda_files = '~/notes/**/*',
            org_default_notes_file = '~/notes/refile.org',
            org_startup_folded = "content",
            org_hide_emphasis_markers = true
        })

        vim.api.nvim_create_autocmd('FileType', {
            pattern = 'org',
            callback = function()
                vim.keymap.set('i', '<S-CR>', '<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>', {
                    silent = false,
                    buffer = true,
                })
                vim.opt.conceallevel = 2
                -- Disable buffer cmp source
                require("cmp").setup.buffer { enabled = false }
            end,
        })

        -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
        -- add ~org~ to ignore_install
        -- require('nvim-treesitter.configs').setup({
        --   ensure_installed = 'all',
        --   ignore_install = { 'org' },
        -- })
    end,
}
