-- Leader key
vim.g.mapleader = " "

-- Bootstrap lazy nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args) pcall(vim.treesitter.start, args.buf) end,
})

require("lazy").setup("plugins")
require("general-preferences")
require("resize")
