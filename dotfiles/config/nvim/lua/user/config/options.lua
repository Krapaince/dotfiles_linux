-- {{@@ header() @@}}

local opt = vim.opt

vim.g.mapleader = ','

opt.autochdir = false
opt.autoindent = true -- Take indent for new line from previous line
opt.clipboard = 'unnamedplus' -- Sync with system clipboard
opt.cmdheight = 1
opt.completeopt = { 'menuone', 'noselect' }
opt.cursorline = true -- Highligh the screen line of the cursor
opt.equalalways = false
opt.expandtab = true -- Use spaces when <Tab> is inserted
opt.fixeol = false
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99 -- Minimum number of screen line below and above the cursor
opt.ignorecase = true -- Make search case insensitive if all lowercase
opt.laststatus = 0
opt.mouse = '' -- Disable mouse
opt.number = true -- Print the line number in front of each line
opt.scrolloff = 99 -- Minimum number of line above and below the cursor line
opt.shell = '/usr/bin/env bash'
opt.shiftwidth = 2 -- Number of spaces to use fir (auto)indent step
opt.shortmess:append('c')
opt.signcolumn = 'yes' -- Always display signcolumn
opt.smartcase = true -- No ignore case when pattern has uppercase
opt.syntax = 'enable' -- Enables syntax highlighing
opt.tabstop = 2 -- Number of spaces that <Tab> in files uses
opt.termguicolors = true
opt.termguicolors = true
opt.timeoutlen = 200 -- Shorten key sequence timeout (ms)
opt.undofile = true
opt.undolevels = 10000
opt.wildignore:append({ '*.o', '*.gcno', '*.gcda' }) -- Files matching these patterns are not completed
opt.wildignorecase = true -- Make filenames autocompletion case-insensitive
opt.wrap = false -- Display long lines as just one line
