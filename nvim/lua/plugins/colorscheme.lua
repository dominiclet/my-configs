return {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require('onedark').setup {
        style = 'darker'
      }
      require('onedark').load()
    end,
}
