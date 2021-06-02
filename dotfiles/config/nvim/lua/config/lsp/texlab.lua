return {
  name = "texlab",
  cmd = "texlab",
  filetypes = { "tex", "bib" },
  settings = {
    texlab = {
      auxDirectory = ".",
      bibtexFormatter = "texlab",
      build = {
        args = {
          "%f",
          "--synctex",
          "--keep-logs",
          "--keep-intermediates"
        },
        executable = "tectonic",
        isContinuous = false
      },
      chktex = {
        onEdit = false,
        onOpenAndSave = false
      },
      diagnosticsDelay = 300,
      formatterLineLength = 80,
      forwardSearch = {
        args = {}
      }
    }
  }
}
