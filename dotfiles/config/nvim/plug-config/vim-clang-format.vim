" {{@@ header() @@}}

let g:clang_format#detect_style_file = 1

"Ctrl-Space to use clang-format
nnoremap <C-Space> :ClangFormat<CR>
vnoremap <C-Space> :ClangFormat<CR>
