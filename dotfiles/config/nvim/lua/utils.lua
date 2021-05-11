-- {{@@ header() @@}}
-- https://github.com/neovim/nvim-lspconfig/blob/56a9268de428acee307f67fc11c08b575e96004c/lua/nvim_lsp/util.lua

local default_options = {
  noremap = true,
  silent = true
}

local M = {}

function M.map(mode, keys, action, opts)
  local options = default_options
  if opts then options = vim.tbl_extend('force', options, opts) end

  vim.api.nvim_set_keymap(mode, keys, action, options)
end

return M
