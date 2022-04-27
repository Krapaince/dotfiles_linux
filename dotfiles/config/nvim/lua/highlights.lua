-- {{@@ header() @@}}

local highlight = require('utils').highlight

vim.o.termguicolors = true
vim.g.vscode_style = 'dark'
vim.g.vscode_transparent = 1
vim.g.vscode_disable_nvimtree_bg = true
vim.cmd('colorscheme vscode')

highlight('VertSplit', { bg = 'None' })
