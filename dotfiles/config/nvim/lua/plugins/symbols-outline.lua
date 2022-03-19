-- {{@@ header() @@}}

return function()
  local map = require('utils').map

  vim.g.symbols_outline = {
    auto_preview = false,
  }

  map('n', '<Leader>s', ':SymbolsOutlineOpen<CR>')
end
