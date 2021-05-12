-- {{@@ header() @@}}

return require('packer').startup(function (use)
    use 'wbthomason/packer.nvim'

    -- Colorschemes
    use 'tomasiser/vim-code-dark'
    -- use 'doums/darcula'
    use 'kjwon15/vim-transparent'

    -- File Explorer
    use { 'kyazdani42/nvim-tree.lua', config = require('config.nvim-tree') }

    -- Status line
    use { 'hoob3rt/lualine.nvim', config = require('config.lualine') }

    use { 'neovim/nvim-lspconfig', config = require('config.lsp') }

    -- Treesitter
    use {
      {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = require('config.treesitter'),
      },
      'nvim-treesitter/playground'
    }

    -- Autocompletion
    use { 'hrsh7th/nvim-compe', config = require('config.compe') }

    use { 'hrsh7th/vim-vsnip', config = require('config.vsnip') }

    -- Finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzy-native.nvim'},
        },
        config = require('config.telescope')
    }

    -- Icons
    use 'kyazdani42/nvim-web-devicons'

    -- Commentary
    use { 'tpope/vim-commentary', config = require('config.vim-commentary') }
end)
