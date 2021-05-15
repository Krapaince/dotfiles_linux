-- {{@@ header() @@}}

return require('packer').startup(function (use)
    use 'wbthomason/packer.nvim'

    -- Colorschemes
    use 'tomasiser/vim-code-dark'
    -- use 'doums/darcula'
    use 'kjwon15/vim-transparent'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'

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

    -- Symbol tree
    use { 'liuchengxu/vista.vim' }

    -- Finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzy-native.nvim', run = 'make'},
        },
        config = require('config.telescope')
    }

    use {
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn['mkdp#util#install']() end,
        ft = {'markdown'}
    }

    {%@@ if profile == "Krapaince-ubuntu" @@%}
    use { 'kristijanhusak/vim-dadbod-ui',
        requires = {{ 'tpope/vim-dadbod' }}
    }
    {%@@ endif @@%}

    -- Utility plugins
    use { 'ntpeters/vim-better-whitespace' } -- Highlight trailing space
    use { 'wesQ3/vim-windowswap' }
    use { 'vim-scripts/DrawIt' }
    use { 'RRethy/vim-illuminate' } -- Highlight similar word
    use { 'camspiers/animate.vim', config = require('config.animate') }
    use { 'norcalli/nvim-colorizer.lua' } -- Color highlighter
    require('config.nvim-colorizer')
    use { 'tpope/vim-commentary', config = require('config.vim-commentary') }
    use { 'pierreglaser/folding-nvim' }
    use { 'junegunn/vim-easy-align' }
end)
