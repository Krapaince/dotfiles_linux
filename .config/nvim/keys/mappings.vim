" set leader key
let mapleader = ","

" Remap ; to :
nnoremap ; :

"jk to return to normal mode
inoremap jk <Esc>

"Allow window movement from active terminal
tnoremap <C-w> <C-\><C-n><C-w>

"Map Alt+Arrows to move lines
nnoremap <C-k> :m-2 <CR>==
nnoremap <C-j> :m+ <CR>==
inoremap <C-k> :m-2 <CR>==gi
inoremap <C-j> :m+ <CR>==gi
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv


nnoremap <Up> <Right>
nnoremap <Right> <Down>
nnoremap <Down> <Left>
nnoremap <Left> <Up>

nnoremap T :tabnew <cr>
nnoremap H :tabprev <cr>
nnoremap L :tabnext <cr>


" Foldline function
hi Folded guibg=NONE guifg=#FF8119 gui=italic
set fillchars=fold:\ ,

function MyFoldText()
    let fline = getline(v:foldstart)
    let lline = getline(v:foldend)
    let sub   = substitute(lline, ' ', '', 'g')
    return fline . "..." . sub
endfunction

set foldtext=MyFoldText()

nnoremap <Space> za
