-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use { 'wbthomason/packer.nvim' }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons'
        }
    }

    -- Aesthetics
    use 'ellisonleao/gruvbox.nvim'
    use 'jacoborus/tender.vim'
    use { 'catppuccin/nvim', name = "catppuccin" }
    use "rebelot/kanagawa.nvim"
    use 'navarasu/onedark.nvim'

    -- Tabline / Statusline
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Bracket/parenthesis pairer
    use 'tmsvg/pear-tree'

    -- Treesitter (syntax highlighting)
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- LSP support
    use 'onsails/lspkind.nvim'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use 'fatih/vim-go'

    -- Autocompletion engine
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-nvim-lua'

    -- Snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- Linting

    -- Git plugin
    use 'tpope/vim-fugitive'
    use 'sindrets/diffview.nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- JSX indent and styling
    use 'maxmellon/vim-jsx-pretty'

    -- Undo
    use 'mbbill/undotree'

    -- Harpoon
    use 'ThePrimeagen/harpoon'

    -- Motion
    use 'ggandor/leap.nvim'
end)
