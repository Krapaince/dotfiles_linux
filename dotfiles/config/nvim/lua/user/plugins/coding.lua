-- {{@@ header() @@}}

return {
  -- {%@@ if profile != "krapaince_min" @@%}

  { 'b0o/schemastore.nvim' },

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
    end,
    opts = function()
      local cmp = require('cmp')
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
        window = {
          completion = {
            col_offset = -3,
            side_padding = 0,
          },
        },
        formatting = {
          fields = { 'kind', 'abbr', 'menu' },
          format = function(_, item)
            local icons = require('krapaince.config.init').icons.kinds
            if icons[item.kind] then
              item.kind = ' ' .. icons[item.kind] .. ' '
            end
            return item
          end,
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
