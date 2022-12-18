-- {{@@ header() @@}}

return function()
  local luasnip = require('luasnip')

  require('luasnip.loaders.from_vscode').lazy_load({
    paths = { '~/.config/nvim/snippets' },
  })

  local map = require('utils').map

  map('i', '<C-l>', function()
    luasnip.jump(1)
  end)
  map('i', '<C-h>', function()
    luasnip.jump(-1)
  end)
end
