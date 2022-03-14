-- {{@@ header() @@}}

local highlight = function(group, color)
  local command = 'hi ' .. group .. ' '
  if color.style then
    command = command .. ' gui=' .. color.style
  end
  if color.fg then
    command = command .. ' guifg=' .. color.fg
  end
  if color.bg then
    command = command .. ' guibg=' .. color.bg
  end
  if color.sp then
    command = command .. ' guisp=' .. color.sp
  end

  vim.cmd(command)
end

vim.o.termguicolors = true
vim.cmd('colorscheme codedark')

highlight('VertSplit', { bg = 'None' })

highlight('CmpItemAbbrDeprecated', { style = 'strikethrough', fg = '#808080' })

highlight('CmpItemAbbrMatch', { bg = 'NONE', fg = '#569CD6' })
highlight('CmpItemAbbrMatchFuzzy', { bg = 'NONE', fg = '#569CD6' })

highlight('CmpItemKindVariable', { bg = 'NONE', fg = '#9CDCFE' })
highlight('CmpItemKindInterface', { bg = 'NONE', fg = '#9CDCFE' })
highlight('CmpItemKindText', { bg = 'NONE', fg = '#9CDCFE' })

highlight('CmpItemKindFunction', { bg = 'NONE', fg = '#C586C0' })
highlight('CmpItemKindMethod', { bg = 'NONE', fg = '#C586C0' })

highlight('CmpItemKindKeyword', { bg = 'NONE', fg = '#D4D4D4' })
highlight('CmpItemKindProperty', { bg = 'NONE', fg = '#D4D4D4' })
highlight('CmpItemKindUnit', { bg = 'NONE', fg = '#D4D4D4' })
