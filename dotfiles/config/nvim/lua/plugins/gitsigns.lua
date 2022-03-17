-- {{@@ header() @@}}

return function()
  local map = require('utils').map
  local highlight = require('utils').highlight

  highlight('GitSignsAddNr', { bg = '#4b5632', fg = 'NONE' })
  highlight('GitSignsChangeNr', { bg = '#6F490B', fg = 'NONE' })
  highlight('GitSignsDeleteNr', { bg = '#4b1818', fg = 'NONE' })

  require('gitsigns').setup({
    signs = {
      add = { numhl = 'GitSignsAddNr' },
      change = { numhl = 'GitSignsChangeNr' },
      delete = { numhl = 'GitSignsDeleteNr' },
      topdelete = { numhl = 'GitSignsDeleteNr' },
      changedelete = { numhl = 'GitSignsChangeNr' },
    },
    signcolumn = false,
    numhl = true,
    linehl = false,
    word_diff = false,
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame = true,
  })

  map('n', '<Leader>g', ':Gitsigns blame_line<CR>')
end
