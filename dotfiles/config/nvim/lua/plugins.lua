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
        use { 'kyazdani42/nvim-tree.lua', config = require('plugins.nvim-tree') }

        -- Status line
        use { 'hoob3rt/lualine.nvim', config = require('plugins.lualine') }

        -- Treesitter
        use {
          {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = require('plugins.treesitter'),
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
            config = require('plugins.lspconfig')
        }

        -- Lsp Diagnostics window
        use {
          'folke/lsp-trouble.nvim',
          requires = 'kyazdani42/nvim-web-devicons',
          config = require('plugins.lsp-trouble'),
        }

        -- Autocompletion
        use { 'hrsh7th/nvim-compe', config = require('plugins.compe') }

        use { 'hrsh7th/vim-vsnip', config = require('plugins.vsnip') }

        -- Symbol tree
        use { 'liuchengxu/vista.vim', config = require('plugins.vista') }

        -- Finder
        use {
            'nvim-telescope/telescope.nvim',
            requires = {
                {'nvim-lua/popup.nvim'},
                {'nvim-lua/plenary.nvim'},
                {'nvim-telescope/telescope-fzy-native.nvim', run = 'make'},
            },
            config = require('plugins.telescope')
        }

        use {
            'iamcco/markdown-preview.nvim',
            run = function() vim.fn['mkdp#util#install']() end,
            ft = {'markdown'}
        }
        {%@@ endif @@%}

        -- Utility plugins
        use { 'ntpeters/vim-better-whitespace' } -- Highlight trailing space
        use { 'tpope/vim-commentary', config = require('plugins.vim-commentary') }
        use { 'pierreglaser/folding-nvim' }
        {%@@ if profile != "krapaince_min" @@%}
        use { 'norcalli/nvim-colorizer.lua' } -- Color highlighter
        require('plugins.nvim-colorizer')
        use { 'wesQ3/vim-windowswap' }
        use { 'camspiers/animate.vim', config = require('plugins.animate') }
        use { 'vim-scripts/DrawIt' }
        use { 'junegunn/vim-easy-align' }

        use { 'rhysd/git-messenger.vim', config = require('plugins.git-messenger') }
        use {
            'folke/todo-comments.nvim',
            requires = "nvim-lua/plenary.nvim",
            config = require('plugins.todo-comments')
        }
        {%@@ endif @@%}
    end,
    config = {
        display = {
            open_fn = require('packer.util').float,
        }
    }
})
