-- {{@@ header() @@}}
local util = require 'lspconfig.util'
local utils = require('plugins.lspconfig.utils')

require'lspconfig'.volar.setup{
  cmd = { "volar-server", "--stdio" },
  filetypes = { 'vue' },
  on_attach = utils.on_attach,
  root_dir = util.root_pattern('package.json', 'vue.config.js'),
  init_options = {
    typescript = {
      serverPath = '/home/krapaince/.npm-global/lib/node_modules/typescript/lib/tsserverlibrary.js'
    },
    languageFeatures = {
      references = true,
      definition = true,
      typeDefinition = true,
      callHierarchy = true,
      hover = true,
      rename = true,
      signatureHelp = true,
      codeAction = true,
      completion = {
        defaultTagNameCase = 'both',
        defaultAttrNameCase = 'kebabCase',
        getDocumentNameCasesRequest = true,
        getDocumentSelectionRequest = true,
      },
      documentLink = true,
      codeLens = true,
      diagnostics = true,
    },
    documentFeatures = {
      selectionRange = true,
      foldingRange = true,
      documentSymbol = true,
      documentColor = true,
      documentFormatting = {
        defaultPrintWidth = 100,
        getDocumentPrintWidthRequest = true,
      },
    },
  },
}
