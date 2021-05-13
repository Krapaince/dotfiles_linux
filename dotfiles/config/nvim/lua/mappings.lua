-- {{@@ header() @@}}
local map = require("utils").map

-- set leader key
vim.g.mapleader = ','

-- Remap ; to :
map('n', ';', ':')

-- jk to return to normal mode
map('i', 'jk', '<Esc>')
map('v', 'jk', '<Esc>')

-- Allow window movement from active terminal
map('t', '<C-w>', '<C-\\><C-n><C-w>')

-- tab navigation
map('n', 'H', ':tabprevious<CR>')
map('n', 'L', ':tabnext<CR>')
map('n', 'T', ':tabnew<CR>')
map('n', 'C', ':tabclose<CR>')

-- "Map Alt+Arrows to move lines
map('n', '<C-k>', ':m-2 <CR>==')
map('n', '<C-j>', ':m+ <CR>==')
map('v', '<C-k>', ':m \'<-2<CR>gv=gv')
map('v', '<C-j>', '::m \'>+1<CR>gv=gv')

-- Fold
map('n', '<Space>', 'za')
