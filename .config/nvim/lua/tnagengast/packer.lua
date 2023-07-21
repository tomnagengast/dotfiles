-- https://laracasts.com/series/neovim-as-a-php-ide/episodes/11
-- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/packer.lua
-- https://github.com/jessarcher/dotfiles/blob/master/nvim/lua/user/plugins.lua

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

-- Change working directory to the project root
-- use({
--     'airblade/vim-rooter',
--     setup = function()
--         vim.g.rooter_manual_only = 1
--     end,
--     config = function()
--         vim.cmd("Rooter")
--     end
-- })

-- Add matching quotes, parens, etc.
use({
    'windwp/nvim-autopairs',
    config = function()
        require('nvim-autopairs').setup()
    end
})

-- Add animation while jumping pages with <C-d> and <C-u>.
-- use({
--     'karb94/neoscroll.nvim',
--     config = function()
--         require('neoscroll').setup()
--     end
-- })

-- Split arrays and methods on multiple lines, or join them back up.
use({
    'AndrewRadev/splitjoin.vim',
    config = function()
        vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
        vim.g.splitjoin_trailing_comma = 1
        vim.g.splitjoin_php_method_chain_full = 1
    end
})

-- Automatically fix indentation when pasting code.
use({
    'sickill/vim-pasta',
    config = function()
        vim.g.pasta_disabled_filetypes = {'fugitive'}
    end
})

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
