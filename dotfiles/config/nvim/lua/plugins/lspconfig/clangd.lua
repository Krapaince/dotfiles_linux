-- {{@@ header() @@}}

return {
    name = 'clangd',
    cwd = { 'clangd', "--background-index", "-clang-tidy" },
    filetype = { "c", "cpp", "objc", "objcpp" },
}
