-- {{@@ header() @@}}

return require('packer').startup({
  function(use)
    use('wbthomason/packer.nvim')

    -- Colorschemes
    use({ 'Mofiqul/vscode.nvim', config = require('plugins.vscode') })

    -- Icons
    use('kyazdani42/nvim-web-devicons')

    -- File Explorer
    use({
      'nvim-neo-tree/neo-tree.nvim',
      branch = 'v2.x',
      requires = {
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
        {
          's1n7ax/nvim-window-picker',
          tag = 'v1.*',
          config = function()
            local colors = require('highlights').colors

            require('window-picker').setup({
              autoselect_one = true,
              include_current = false,
              filter_rules = {
                bo = {
                  filetype = { 'neo-tree', 'neo-tree-popup', 'notify', 'Trouble' },
                  buftype = { 'terminal', 'quickfix' },
                },
              },
              fg_color = colors.picton_blue,
              other_win_hl_color = colors.eclipse,
            })
          end,
        },
      },
      config = require('plugins.neo-tree'),
    })

    -- Status line
    use({
      'hoob3rt/lualine.nvim',
      config = require('plugins.lualine'),
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    })
    -- Tab libe
    use({
      'keklleo/tabline.nvim',
      branch = 'change-show-tabs-always',
      config = require('plugins.tabline'),
      requires = { { 'hoob3rt/lualine.nvim', opt = true }, { 'kyazdani42/nvim-web-devicons', opt = true } },
    })

    -- Treesitter
    use({
      {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = require('plugins.treesitter'),
      },
      'nvim-treesitter/playground',
    })

    -- {%@@ if profile != "krapaince_min" @@%}

    use({
      'neovim/nvim-lspconfig',
      requires = {
        { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' },
        'jose-elias-alvarez/null-ls.nvim',
        'jose-elias-alvarez/typescript.nvim',
        'simrat39/rust-tools.nvim',
      },
    })
    use({ 'b0o/schemastore.nvim' })

    -- Lsp progress
    use({ 'j-hui/fidget.nvim', config = require('plugins.fidget') })

    -- Lsp Diagnostics window
    use({
      'folke/lsp-trouble.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = require('plugins.lsp-trouble'),
    })

    use({ 'L3MON4D3/LuaSnip', config = require('plugins.luasnip'), tag = 'v1.*' })

    -- Autocompletion
    use({
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
        'onsails/lspkind-nvim',
      },
      config = require('plugins.cmp'),
    })

    -- Folding
    use({ 'kevinhwang91/nvim-ufo', requires = { 'kevinhwang91/promise-async' }, config = require('plugins.nvim-ufo') })

    -- Symbol tree
    use({ 'simrat39/symbols-outline.nvim', config = require('plugins.symbols-outline') })

    -- Finder
    use({
      'nvim-telescope/telescope.nvim',
      requires = {
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      },
      config = require('plugins.telescope'),
    })

    use({
      'iamcco/markdown-preview.nvim',
      run = function()
        vim.fn['mkdp#util#install']()
      end,
      ft = { 'markdown' },
    })

    use('nathom/filetype.nvim')

    -- {%@@ endif @@%}

    -- Utility plugins
    use({ 'ntpeters/vim-better-whitespace', config = require('plugins.vim-better-whitespace') }) -- Highlight trailing space
    use({ 'numToStr/Comment.nvim', config = require('plugins.comment') })
    -- {%@@ if profile != "krapaince_min" @@%}

    use({ 'norcalli/nvim-colorizer.lua', config = require('plugins.nvim-colorizer') }) -- Color highlighter
    use({ 'wesQ3/vim-windowswap' })
    use({ 'junegunn/vim-easy-align' })

    use({
      'folke/todo-comments.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = require('plugins.todo-comments'),
    })
    use({ 'JoosepAlviste/nvim-ts-context-commentstring' })

    -- git related plugins
    use({ 'tpope/vim-fugitive' })
    use({
      'lewis6991/gitsigns.nvim',
      config = require('plugins.gitsigns'),
      requires = {
        'nvim-lua/plenary.nvim',
      },
    })

    use('tweekmonster/startuptime.vim')

    use({
      'luukvbaal/stabilize.nvim',
      config = function()
        require('stabilize').setup()
      end,
    })
    -- {%@@ endif @@%}
    --
  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    },
  },
})
