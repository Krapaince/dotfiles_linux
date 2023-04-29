-- {{@@ header() @@}}

return {
  {
    'Mofiqul/vscode.nvim',
    priority = 1000,
    opts = {
      transparent = true,
      italic_comments = false,
    },
    config = function(_, opts)
      require('vscode').setup(opts)
      require('vscode').load()
    end,
    lazy = false,
  },
}
