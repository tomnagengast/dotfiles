-- https://laracasts.com/series/neovim-as-a-php-ide/episodes/11
-- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/packer.lua

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require('packer').reset()

require('packer').init({
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'single' })
        end,
        prompt_border = 'solid'
    }
})

local use = require('packer').use

use 'wbthomason/packer.nvim'

use({
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
})

use({'rose-pine/neovim', as = 'rose-pine'})

use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

use('nvim-treesitter/playground')

use('theprimeagen/harpoon')

-- use("theprimeagen/refactoring.nvim")

use('mbbill/undotree')

use('tpope/vim-fugitive')

use('tpope/vim-commentary')

-- use('tpope/vim-dadbod')

-- use('kristijanhusak/vim-dadbod-ui')

-- use("folke/zen-mode.nvim")

use("github/copilot.vim")

use("laytan/cloak.nvim")

-- use("PedramNavid/dbtpal")

-- use('chrismaher/vim-lookml')

-- use('iamcco/markdown-preview.nvim')

-- https://github.com/VonHeikemen/lsp-zero.nvim
use({
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

})

-- custom plugins
use('~/code/tnagengast/data-tools.nvim')

if packer_bootstrap then
    require('packer').sync()
end


-- see laracasts@3:30
vim.cmd([[
    augroup packer_user_config
        autocmd! 
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])
