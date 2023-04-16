-- {{@@ header() @@}}

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('{{@@ user @@}}.options')
require('{{@@ user @@}}.mappings')
require('lazy').setup('{{@@ user @@}}.plugins')
require('{{@@ user @@}}.highlights')
-- {%@@ if profile != "krapaince_min" @@%}

require('{{@@ user @@}}.lsp')

-- {%@@ endif @@%}
