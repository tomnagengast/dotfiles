-- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/packer.lua

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- https://github.com/wbthomason/packer.nvim
    use 'wbthomason/packer.nvim'

    -- https://github.com/nvim-telescope/telescope.nvim
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- https://github.com/projekt0n/github-nvim-theme
    use({
        'projekt0n/github-nvim-theme', tag = 'v0.0.7',
        config = function()
        require('github-theme').setup({
            theme_style = 'dark_default'
        })
        end
    })

    -- https://github.com/nvim-treesitter/nvim-treesitter
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- https://github.com/nvim-treesitter/playground
    use('nvim-treesitter/playground')

    -- https://github.com/ThePrimeagen/harpoon
    use('theprimeagen/harpoon')

    -- https://github.com/ThePrimeagen/refactoring.nvim
    -- use("theprimeagen/refactoring.nvim")

    -- https://github.com/mbbill/undotree
    use('mbbill/undotree')

    -- https://github.com/tpope/vim-fugitive
    use('tpope/vim-fugitive')

    -- -- https://github.com/tpope/vim-fugitive
    use('tpope/vim-commentary')

    -- https://github.com/tpope/vim-dadbod
    use('tpope/vim-dadbod')

    -- https://github.com/folke/zen-mode.nvim
    -- use("folke/zen-mode.nvim")

    -- https://github.com/github/copilot.vim
    use("github/copilot.vim")

    -- https://github.com/laytan/cloak.nvim
    use("laytan/cloak.nvim")

    -- https://github.com/pdrmnvd/dbtpal
    -- use('pdrmnvd/dbtpal')

    -- https://github.com/iamcco/markdown-preview.nvim
    -- use('iamcco/markdown-preview.nvim')

    -- https://github.com/VonHeikemen/lsp-zero.nvim
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }

end)

