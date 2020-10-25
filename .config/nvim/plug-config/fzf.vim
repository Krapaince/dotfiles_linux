"Set fuzzy-search keybind
nnoremap <C-f> :Files<CR>

" Show FZF when pressing ctrl-p
noremap <c-p> :call fzf#vim#files('', fzf#vim#with_preview('right'))<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore deps -g ""'
"" Fzf search in file
nnoremap / :BLines<CR>
"" Search in current project
nnoremap <c-s> :Ag<CR>
