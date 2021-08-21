-- {{@@ header() @@}}

return require('packer').startup({
    function (use)
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

        -- Treesitter
        use {
          {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = require('config.treesitter'),
          },
          'nvim-treesitter/playground'
        }

        {%@@ if profile != "krapaince_min" @@%}
        use { 'neovim/nvim-lspconfig',
            requires = {
                { 'RishabhRD/nvim-lsputils',
                    requires = 'RishabhRD/popfix',
                },
            },
            config = require('config.lsp')
        }

        -- Lsp Diagnostics window
        use {
          'folke/lsp-trouble.nvim',
          requires = 'kyazdani42/nvim-web-devicons',
          config = require('config.lsp-trouble'),
        }

        -- Autocompletion
        use { 'hrsh7th/nvim-compe', config = require('config.compe') }

        use { 'hrsh7th/vim-vsnip', config = require('config.vsnip') }

        -- Symbol tree
        use { 'liuchengxu/vista.vim', config = require('config.vista') }

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
        {%@@ endif @@%}

        -- Utility plugins
        use { 'ntpeters/vim-better-whitespace' } -- Highlight trailing space
        use { 'tpope/vim-commentary', config = require('config.vim-commentary') }
        use { 'pierreglaser/folding-nvim' }
        {%@@ if profile != "krapaince_min" @@%}
        use { 'norcalli/nvim-colorizer.lua' } -- Color highlighter
        require('config.nvim-colorizer')
        use { 'wesQ3/vim-windowswap' }
        use { 'camspiers/animate.vim', config = require('config.animate') }
        use { 'vim-scripts/DrawIt' }
        use { 'junegunn/vim-easy-align' }

        use { 'rhysd/git-messenger.vim', config = require('config.git-messenger') }
        use {
            'folke/todo-comments.nvim',
            requires = "nvim-lua/plenary.nvim",
            config = require('config.todo-comments')
        }
        {%@@ endif @@%}
    end,
    config = {
        display = {
            open_fn = require('packer.util').float,
        }
    }
})
