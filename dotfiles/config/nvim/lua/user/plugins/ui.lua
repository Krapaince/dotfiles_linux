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

      local diag_icons = require('{{@@ user @@}}.config.init').icons.diagnostics
      local diagnostics = {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        color_error = colors.vscRed,
        color_warn = colors.vscOrange,
        color_info = colors.vscYellow,
        color_hint = colors.vscFront,
        symbols = {
          error = diag_icons.Error .. ' ',
          warn = diag_icons.Warn .. ' ',
          info = diag_icons.Hint .. ' ',
          hint = diag_icons.Info .. ' ',
        },
      }

      local winbar_filename = {
        'filename',
        path = 1,
        shorting_target = 20,
      }

      local navic = require('nvim-navic')
      return {
        tabline = {
          lualine_a = {
            'tabs',
          },
        },
        winbar = { lualine_c = { winbar_filename } },
        inactive_winbar = { lualine_c = { winbar_filename } },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', diagnostics },
          lualine_c = {
            'filename',
            {
              function()
                return navic.get_location()
              end,
              cond = function()
                return navic.is_available()
              end,
            },
          },
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
      }
    end,
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
      { 'SmiteshP/nvim-navic', dependencies = 'neovim/nvim-lspconfig' },
    },
  },

  { 'nvim-tree/nvim-web-devicons', lazy = true },

  -- {%@@ if profile != "krapaince_min" @@%}

  { 'norcalli/nvim-colorizer.lua', opts = { '*' } },

  { 'luukvbaal/stabilize.nvim' },

  -- {%@@ endif @@%}
  --
}
