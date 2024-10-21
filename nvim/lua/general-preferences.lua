----- Preferences -----
vim.cmd [[set mouse=a]]

local opt = vim.opt

opt.termguicolors = true
opt.showmatch = true
opt.ignorecase = true
opt.hlsearch = true
opt.incsearch = true
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.shiftwidth = 4
opt.autoindent = true
opt.expandtab = true
opt.number = true
opt.wildmenu = true
opt.ttyfast = true
opt.relativenumber = true
opt.cursorline = true

vim.api.nvim_set_option("clipboard", "unnamed")

----- Keymaps -----
function map(mode, shortcut, command)
    vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true })
end

-- Remove search highlighting
map('n', '<leader>c', '<cmd>nohl<cr>')
-- Tab navigation
map('n', 'te', '<cmd>tab split<cr>')
map('n', 'tn', '<cmd>tabnext<cr>')
map('n', 'tp', '<cmd>tabprev<cr>')

map('i', 'jk', '<esc>')

map({ 'n', 'v' }, 'H', '^')
map({ 'n', 'v' }, 'L', '$')

-- Quickfix list
map('n', 'zj', '<cmd>cnext<cr>')
map('n', 'zk', '<cmd>cprev<cr>')
map('n', 'zc', '<cmd>cclose<cr>')

-- Easier save and quit
map('n', '<leader>w', '<cmd>w<cr>')
map('n', '<leader>q', '<cmd>q<cr>')
