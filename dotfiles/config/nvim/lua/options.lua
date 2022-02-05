-- {{@@ header() @@}}

local opt = vim.opt

opt.wildignorecase = true                             -- Make filenames autocompletion case-insensitive

opt.ignorecase = true                                 -- Make search case insensitive if all lowercase
opt.smartcase = true                                  -- No ignore case when pattern has uppercase

opt.syntax = 'enable'                                 -- Enables syntax highlighing
opt.wrap = false                                      -- Display long lines as just one line

opt.foldlevelstart = 99                               -- Minimum number of screen line below and above the cursor

opt.termguicolors = true                              -- Set colorscheme

opt.scrolloff = 99                                    -- Minimum number of line above and below the cursor line
opt.timeoutlen = 200                                  -- Shorten key sequence timeout

opt.clipboard = 'unnamedplus'                         -- Copy paste between vim and everything else

opt.tabstop = 2                                       -- Number of spaces that <Tab> in files uses
opt.shiftwidth = 2                                    -- Number of spaces to use fir (auto)indent step
opt.expandtab = true                                  -- Use spaces when <Tab> is inserted
opt.autoindent = true                                 -- Take indent for new line from previous line

opt.number = true                                     -- Print the line number in front of each line
opt.cursorline = true                                 -- Highligh the screen line of the cursor

opt.wildignore = opt.wildignore + '*.o,*.gcno,*.gcda' -- Files matching these patterns are not completed
