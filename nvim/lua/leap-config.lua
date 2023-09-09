require('leap').add_default_mappings()

vim.keymap.set({'n', 'x', 'o'}, 'q', '<Plug>(leap-forward-to)')
vim.keymap.set({'n', 'x', 'o'}, 'Q', '<Plug>(leap-backward-to)')
