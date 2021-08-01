" {{@@ header() @@}}
" Some configuration that can't be put in a lua file

" Plugin animate:
" Animation time in ms
let g:animate#duration = 50.0

" Vista
let g:vista#renderer#enable_icon = 1
let g:vista_default_executive = 'nvim_lsp'

" vim-easy-align
" Align GitHub/Lab-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>
