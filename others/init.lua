require('plugins')
require('lsp')
require('treesitter')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd('colorscheme tender')

require('nvim-tree').setup({
    update_focused_file = {
        enable = true
    }
})

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
-- Fzf
vim.api.nvim_set_keymap('n', '<c-p>',
    "<cmd>lua require('fzf-lua').files()<CR>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-p>',
    "<cmd>lua require('fzf-lua').live_grep()<CR>",
    { noremap = true, silent = true })
