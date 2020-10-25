let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-actions',
    \ 'coc-tsserver',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-cssmodules',
    \ 'coc-yaml',
    \ 'coc-python',
    \ 'coc-prettier',
    \ 'coc-json',
    \ 'coc-marketplace',
\ ]

"Configure coc.nvim to use tab to navigate completions and enter to confirm
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

set completeopt+=preview
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

let g:coc_snippet_prev = '<C-h>'
let g:coc_snippet_next = '<C-l>'

" CocAction
nnoremap <C-c> :CocAction<CR>

"Alias the prettier for the current buffer to 'Prettier'
command! -nargs=0 Prettier :CocCommand prettier.formatFile
