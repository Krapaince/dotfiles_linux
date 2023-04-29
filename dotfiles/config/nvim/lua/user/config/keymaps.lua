-- {{@@ header() @@}}

local map = require('{{@@ user @@}}.utils').map

map('n', ';', ':')
map({ 'i', 'v' }, 'jk', '<Esc>')

map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

-- Tab navigation
map('n', 'H', ':tabprevious<cr>')
map('n', 'L', ':tabnext<cr>')
map('n', 'T', ':tabnew<Cr>')
map('n', 'C', ':tabclose<cr>')

-- Resize buffer size
map('n', '<Up>', '<cmd>resize +2<cr>')
map('n', '<Down>', '<cmd>resize -2<cr>')
map('n', '<Left>', '<cmd>vertical resize -2<cr>')
map('n', '<Right>', '<cmd>vertical resize +2<cr>')

-- Fold
map('n', '<Space>', 'za')

map('n', 'n', ':cnext<CR>')
map('n', 'N', ':cprev<CR>')

-- Move Lines
map('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
map('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
map('v', '<A-j>', ':m \'>+1<cr>gv=gv', { desc = 'Move down' })
map('v', '<A-k>', ':m \'<-2<cr>gv=gv', { desc = 'Move up' })

-- https://github.com/mhinz/vim-galore#dont-lose-selection-when-shifting-sidewards
map('v', '<', '<gv')
map('v', '>', '>gv')
