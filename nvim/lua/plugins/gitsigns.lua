return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require('gitsigns').setup{
            on_attach = function(bufnr)
                local gitsigns = require('gitsigns')
                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end
                map('n', '<leader>gb', gitsigns.blame)
                map('n', '<leader>gS', gitsigns.stage_buffer)
                map('n', '<leader>gp', gitsigns.preview_hunk)
                map('n', '<leader>gi', gitsigns.preview_hunk_inline)
                map('n', '<leader>gq', function() gitsigns.setqflist('all') end)
            end
        }
    end
}
