" {{@@ header() @@}}
" Some configuration that can't be put in a lua file

" Plugin animate:
" Animation time in ms
let g:animate#duration = 50.0

" Vista
let g:vista#renderer#enable_icon = 1
let g:vista_default_executive = 'nvim_lsp'

" Vim-illuminate
let g:Illuminate_delay = 500
let g:Illuminate_highlightUnderCursor = 0

hi LspReferenceText gui=inverse
hi LspReferenceRead gui=inverse
hi LspReferenceWrite gui=inverse
