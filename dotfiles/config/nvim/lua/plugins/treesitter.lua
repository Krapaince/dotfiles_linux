-- {{@@ header() @@}}

return {

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'BufReadPost',
    opts = {
      ensure_installed = {
        'bash',
        'bibtex',
        'c',
        'cpp',
        'css',
        'dockerfile',
        'elixir',
        'fish',
        'html',
        'javascript',
        'json',
        'json5',
        'latex',
        'lua',
        'markdown',
        'mermaid',
        'python',
        'rust',
        'typescript',
        'yaml',
      },
      sync_install = true,
      context_commentstring = {
        enable = true,
      },
      highlight = {
        enable = true,
      },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25,
        persist_queries = false,
        keybindings = {
          toggle_query_editor = 'o',
          toggle_hl_groups = 'i',
          toggle_injected_languages = 't',
          toggle_anonymous_nodes = 'a',
          toggle_language_display = 'I',
          focus_language = 'f',
          unfocus_language = 'F',
          update = 'R',
          goto_node = '<cr>',
          show_help = '?',
        },
      },
    },
    main = 'nvim-treesitter.configs',
  },
}
