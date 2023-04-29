-- {{@@ header() @@}}

local M = {}

---@class KrapainceVimConfig
local defaults = {
  icons = {
    diagnostics = {
      Error = '',
      Warn = '',
      Hint = '',
      Info = '',
    },
    git = {
      removed = '',
      added = '✚',
      modified = '',
      deleted = '',
      renamed = '',
      untracked = '*',
      ignored = '',
      unstaged = '',
      staged = '',
      conflict = '',
    },
    kinds = {
      Array = '',
      Boolean = '',
      Class = '',
      Color = '',
      Constant = '',
      Constructor = '',
      EnumMember = '',
      Enum = '練',
      Event = '',
      Field = '',
      File = '',
      Folder = '',
      Function = '',
      Interface = 'ﰮ',
      Key = '',
      Keyword = '',
      Method = '',
      Module = '',
      Namespace = '',
      Null = '',
      Object = '',
      Operator = '',
      Property = '襁',
      Reference = '',
      Snippet = '',
      String = '',
      Struct = 'ﳤ',
      Text = '',
      TypeParameter = '',
      Unit = '',
      Value = '',
      Variable = '',
    },
  },
}

local options

function M.setup(opts)
  options = vim.tbl_deep_extend('force', defaults, opts or {})
  require('{{@@ user @@}}.config.autocmds')
  require('{{@@ user @@}}.config.keymaps')
end

M.did_init = false
function M.init()
  if not M.did_init then
    M.did_init = true
    require('{{@@ user @@}}.config.options')
  end
end

setmetatable(M, {
  __index = function(_, key)
    if options == nil then
      return vim.deepcopy(defaults)[key]
    end

    ---@cast options KrapainceVimConfig
    return options[key]
  end,
})

return M
