return {
    "ggandor/leap.nvim",
    config = function()
        require('leap')
        vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap-forward-to)')
        vim.keymap.set({'n', 'x', 'o'}, 'S', '<Plug>(leap-backward-to)')
    end,
}
