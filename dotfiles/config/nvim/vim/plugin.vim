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

{%@@ if profile == "Krapaince-ubuntu" @@%}
" Vim-dadbod-ui
if filereadable(expand('~/.config/nvim/vim/db-url.vim'))
    source $HOME/.config/nvim/vim/db-url.vim
endif

" Source is automatically added, you just need to include it in the chain complete list
let g:completion_chain_complete_list = {
    \   'sql': [
    \    {'complete_items': ['vim-dadbod-completion']},
    \   ],
    \ }
" Make sure `substring` is part of this list. Other items are optional for this completion source
let g:completion_matching_strategy_list = ['exact', 'substring']
" Useful if there's a lot of camel case items
let g:completion_matching_ignore_case = 1
let g:db_ui_use_nerd_fonts = 1
{%@@ endif @@%}

" vim-easy-align
" Align GitHub/Lab-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>
