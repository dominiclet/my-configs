require('leap').add_default_mappings()

vim.keymap.set({'n', 'x', 'o'}, 'sf', '<Plug>(leap-forward-to)')
vim.keymap.set({'n', 'x', 'o'}, 'sb', '<Plug>(leap-backward-to)')
