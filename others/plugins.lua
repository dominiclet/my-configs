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
    use 'itchyny/lightline.vim'
    use 'jacoborus/tender.vim'

    -- Bracket/parenthesis pairer
    use 'tmsvg/pear-tree'

    -- Treesitter (syntax highlighting)
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- LSP support
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- Autocompletion engine
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-nvim-lua'

    -- Snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- Linting

    -- Git plugin
    use 'tpope/vim-fugitive'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
end)
