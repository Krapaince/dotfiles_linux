-- {{@@ header() @@}}

return {
  {
    'hoob3rt/lualine.nvim',
    opts = function()
      local colors = require('vscode.colors').get_colors()

      local mode_highlight = function(highlight)
        return {
          a = { bg = highlight, fg = colors.vscLeftMid, gui = 'bold' },
          b = { bg = colors.vscLeftMid, fg = highlight },
          c = { bg = colors.vscLeftDark, fg = colors.vscFront },
        }
      end

      local theme = {
        normal = mode_highlight(colors.vscBlue),
        insert = mode_highlight(colors.vscYellowOrange),
        visual = mode_highlight(colors.vscGreen),
      }

      local diagnostics = {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        color_error = colors.vscRed,
        color_warn = colors.vscOrange,
        color_info = colors.vscYellow,
        color_hint = colors.vscFront,
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      }

      local winbar_filename = {
        'filename',
        path = 1,
        shorting_target = 20,
      }

      require('lualine').setup({
        tabline = {
          lualine_x = { require('tabline').tabline_tabs },
        },
        winbar = { lualine_c = { winbar_filename } },
        inactive_winbar = { lualine_c = { winbar_filename } },
        status_line = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', diagnostics },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat' },
          lualine_y = { 'filetype' },
          lualine_z = { 'location', 'progress' },
        },
        options = {
          theme = theme,
          disabled_filetypes = { 'packer', 'neo-tree' },
          ignore_focus = { 'neo-tree' },
          globalstatus = true,
        },
        extensions = {},
      })
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
  {
    'keklleo/tabline.nvim',
    opts = { enable = false },
    dependencies = {
      { 'hoob3rt/lualine.nvim' },
      { 'nvim-tree/nvim-web-devicons' },
    },
  },

  { 'nvim-tree/nvim-web-devicons', lazy = true },

  -- {%@@ if profile != "krapaince_min" @@%}

  { 'norcalli/nvim-colorizer.lua', opts = { '*' } },

  { 'luukvbaal/stabilize.nvim' },

  -- {%@@ endif @@%}
  --
}
