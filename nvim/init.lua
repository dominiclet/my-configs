require('plugins')
require('lsp')
require('treesitter')
require('telescopeconfig')
require('nvimtree-config')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Colorscheme
vim.cmd.colorscheme "catppuccin-mocha"

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
opt.number = true
opt.wildmenu = true
opt.ttyfast = true

vim.api.nvim_set_option("clipboard","unnamed")

----- Keymaps -----
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

-- Nvim tree
map('n', '<C-n>', '<cmd>NvimTreeToggle<cr>')
-- Remove search highlighting
map('n', '<leader>c', '<cmd>nohl<cr>')
-- Tab navigation
map('n', 'te', '<cmd>tabedit<cr>')
map('n', 'tn', '<cmd>tabnext<cr>')
map('n', 'tp', '<cmd>tabprev<cr>')
-- Split window navigation
map('n', 's', '<ESC>')
map('n', 'sh', '<C-w>h')
map('n', 'sj', '<C-w>j')
map('n', 'sk', '<C-w>k')
map('n', 'sl', '<C-w>l')
map('n', 'sv', '<cmd>vsplit<cr>')
map('n', 'ss', '<cmd>split<cr>')
map('n', '<leader>r', '<C-w>r')
-- Merge conflict Fugitive git
map('n', 'gh', '<cmd>diffget //2<cr>')
map('n', 'gl', '<cmd>diffget //3<cr>')
-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<S-p>', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

