" Nerd tree toggle
nmap <C-b> :NERDTreeToggle<CR>
" Nerd tree Mirror
nmap <C-m> :NERDTreeMirror<CR>
" Nerd Tree ignore files
let NERDTreeIgnore=['\.o$', '\.gcno$', '\.gcda$']

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

" Show dot files
let NERDTreeShowHidden=1
