nnoremap <silent> <Up>    :call animate#window_delta_height(5)<CR>
nnoremap <silent> <Down>  :call animate#window_delta_height(-5)<CR>
nnoremap <silent> <Left>  :call animate#window_delta_width(5)<CR>
nnoremap <silent> <Right> :call animate#window_delta_width(-5)<CR>

" Animation time in ms
let g:animate#duration = 50.0
