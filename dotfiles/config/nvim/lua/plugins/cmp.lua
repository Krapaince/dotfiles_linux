-- {{@@ header() @@}}

return function()
  local cmp = require('cmp')
  local lspkind = require('lspkind')
  local highlight = require('utils').highlight

  highlight('CmpItemAbbrDeprecated', { style = 'strikethrough', fg = '#808080' })

  highlight('CmpItemAbbrMatch', { bg = 'NONE', fg = '#569CD6' })
  highlight('CmpItemAbbrMatchFuzzy', { bg = 'NONE', fg = '#569CD6' })

  highlight('CmpItemKindVariable', { bg = 'NONE', fg = '#9CDCFE' })
  highlight('CmpItemKindInterface', { bg = 'NONE', fg = '#9CDCFE' })
  highlight('CmpItemKindText', { bg = 'NONE', fg = '#9CDCFE' })

  highlight('CmpItemKindFunction', { bg = 'NONE', fg = '#C586C0' })
  highlight('CmpItemKindMethod', { bg = 'NONE', fg = '#C586C0' })

  highlight('CmpItemKindKeyword', { bg = 'NONE', fg = '#D4D4D4' })
  highlight('CmpItemKindProperty', { bg = 'NONE', fg = '#D4D4D4' })
  highlight('CmpItemKindUnit', { bg = 'NONE', fg = '#D4D4D4' })

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn['vsnip#anonymous'](args.body)
      end,
    },

    mapping = {
      ['<C-Space>'] = cmp.mapping.complete({
        config = {
          sources = {
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
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
      { name = 'vsnip' },
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
  })

  vim.opt.completeopt = { 'menuone', 'noselect' }
  -- Remove cmp status display
  vim.opt.shortmess:append('c')
end
