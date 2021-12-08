-- {{@@ header() @@}}
return {
  name = 'volar',
  cmd = { "volar-server", "--stdio" },
  filetypes = { 'vue'},
  init_options = {
    typescript = {
      serverPath = '/home/krapaince/.npm-global/lib/node_modules/typescript/lib/tsserverlibrary.js'
    }
  }
}
