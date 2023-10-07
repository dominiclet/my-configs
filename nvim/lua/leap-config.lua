require('leap')

vim.keymap.set({'n', 'x', 'o'}, 'q', '<Plug>(leap-forward-to)')
vim.keymap.set({'n', 'x', 'o'}, 'Q', '<Plug>(leap-backward-to)')
