" {{@@ header() @@}}

" Nerd tree toggle
nmap <C-b> :NERDTreeToggleVCS<CR>
" Nerd tree Mirror
nmap <C-m> :NERDTreeMirrorVCS<CR>
" Nerd Tree ignore files
let NERDTreeIgnore=['\.o$', '\.gcno$', '\.gcda$']

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

" Show dot files
let NERDTreeShowHidden=1
