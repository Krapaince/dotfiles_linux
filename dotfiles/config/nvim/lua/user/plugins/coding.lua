-- {{@@ header() @@}}

return {
  -- {%@@ if profile != "krapaince_min" @@%}

  { 'b0o/schemastore.nvim' },

  {
    'neovim/nvim-lspconfig',
    event = 'BufReadPre',
    dependencies = {
      { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' },
      'jose-elias-alvarez/null-ls.nvim',
      'jose-elias-alvarez/typescript.nvim',
      'simrat39/rust-tools.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
  },

  { 'j-hui/fidget.nvim', event = 'BufReadPre', opts = {} },

  {
    'L3MON4D3/LuaSnip',
    version = '1.*',
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load({
        paths = { '~/.config/nvim/snippets' },
      })
    end,
    keys = {
      {
        '<C-l>',
        function()
          require('luasnip').jump(1)
        end,
        mode = 'i',
      },
      {
        '<C-h>',
        function()
          require('luasnip').jump(-1)
        end,
        mode = 'i',
      },
    },
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'onsails/lspkind-nvim',
    },
    init = function(_)
      local highlight = require('{{@@ user @@}}.utils').highlight
      local colors = require('vscode.colors').get_colors()

      highlight('CmpItemAbbrDeprecated', { style = 'strikethrough', fg = colors.vscGray })

      highlight('CmpItemAbbrMatch', { bg = 'NONE', fg = colors.vscBlue })
      highlight('CmpItemAbbrMatchFuzzy', { bg = 'NONE', fg = colors.vscBlue })

      highlight('CmpItemKindVariable', { bg = 'NONE', fg = colors.vscLightBlue })
      highlight('CmpItemKindInterface', { bg = 'NONE', fg = colors.vscLightBlue })
      highlight('CmpItemKindText', { bg = 'NONE', fg = colors.vscLightBlue })

      highlight('CmpItemKindFunction', { bg = 'NONE', fg = colors.vscPink })
      highlight('CmpItemKindMethod', { bg = 'NONE', fg = colors.vscPink })

      highlight('CmpItemKindKeyword', { bg = 'NONE', fg = colors.vscFront })
      highlight('CmpItemKindProperty', { bg = 'NONE', fg = colors.vscFront })
      highlight('CmpItemKindUnit', { bg = 'NONE', fg = colors.vscFront })

      vim.opt.completeopt = { 'menuone', 'noselect' }
      -- Remove cmp status display
      vim.opt.shortmess:append('c')
    end,
    opts = function()
      local cmp = require('cmp')
      local lspkind = require('lspkind')
      local luasnip = require('luasnip')

      return {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ['<C-Space>'] = cmp.mapping.complete({
            config = {
              sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' },
                { name = 'buffer' },
              },
            },
          }),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = 'buffer' },
        },
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = '50',
            symbol_map = {
              Text = '',
              Method = '',
              Function = '',
              Constructor = '',
              Field = 'ﴲ',
              Variable = '[]',
              Class = '',
              Interface = 'ﰮ',
              Module = '',
              Property = '襁',
              Unit = '',
              Value = '',
              Enum = '練',
              Keyword = '',
              Snippet = '',
              Color = '',
              File = '',
              Reference = '',
              Folder = '',
              EnumMember = '',
              Constant = 'ﲀ',
              Struct = 'ﳤ',
              Event = '',
              Operator = '',
              TypeParameter = '',
            },
          }),
        },
      }
    end,
  },

  -- Symbol tree
  {
    'simrat39/symbols-outline.nvim',
    keys = { { '<Leader>s', '<cmd>SymbolsOutlineOpen<CR>' } },
    opts = {},
  },
  { 'JoosepAlviste/nvim-ts-context-commentstring', lazy = true },

  -- {%@@ endif @@%}

  {
    'numToStr/Comment.nvim',
    opts = {
      ignore = '^$',
      toggler = {
        line = '<Space>/',
      },
    },
  },
}
