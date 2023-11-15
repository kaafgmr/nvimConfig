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

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use { "bluz71/vim-moonfly-colors", as = "moonfly" }

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use('ThePrimeagen/harpoon')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'

    --statusline
    use{
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        opts = {
            options = {
                icons_enabled = false,
                theme = "iceberg_dark",
                component_separators = '|',
                section_separators = '',
            },
        }
    }
    require('lualine').setup()


  if packer_bootstrap then
    require('packer').sync()
  end
end)
