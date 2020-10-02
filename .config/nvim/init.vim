"Configure Plug
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rhysd/vim-clang-format'
Plug 'neomake/neomake'
Plug 'cloudhead/neovim-fuzzy'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-airline/vim-airline'
Plug 'tomasiser/vim-code-dark'
Plug 'liuchengxu/vista.vim'
Plug 'vim-scripts/vim-stay' " Save cursor position and folds when closing file
Plug 'Konfekt/FastFold'
Plug 'preservim/nerdtree'
Plug 'rhysd/git-messenger.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'chrisbra/unicode.vim'

Plug 'godlygeek/tabular' | Plug 'tpope/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }


Plug 'junegunn/fzf', { 'dir':'~/.fzf','do':'./install --all' }
Plug 'junegunn/fzf.vim',

call plug#end()

" Snippet
source ~/.config/nvim/snippet.vim

"Use syntax-based folding
set foldmethod=syntax
set foldlevelstart=99

"Make filenames autocompletion case-insensitive
set wildignorecase

"Make search case insensitive if all lowercase
set ignorecase
set smartcase

"Set colorscheme
set termguicolors
colorscheme codedark

"Configure coc.nvim to use tab to navigate completions and enter to confirm
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
nnoremap <C-c> <Plug>(coc-rename)
nnoremap <silent> K :call CocActionAsync('doHover')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-declaration)
set completeopt+=preview
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

let g:coc_snippet_prev = '<C-h>'
let g:coc_snippet_next = '<C-l>'

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocAction('highlight')

" CocAction
nnoremap <C-c> :CocAction<CR>

"Configure vista
let g:vista#renderer#enable_icon = 1
let g:vista_default_executive = 'coc'
"let g:vista_echo_cursor_strategy = 'floating_win'

"Configure cpp highlighting
let g:cpp_member_variable_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1

"Configure airline
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline_right_sep = ''
let g:airline_left_sep = ''

"set leader key
let mapleader = ","

"Configure GitMessenger
let g:git_messenger_no_default_mappings=v:true
nmap <leader>g :GitMessenger<CR>

"Remap ; to :
nnoremap ; :

"Shorten key sequence timeout
set timeoutlen=200

"jk to return to normal mode
inoremap jk <Esc>

let g:clang_format#detect_style_file = 1

"Allow window movement from active terminal
tnoremap <C-w> <C-\><C-n><C-w>

"Set fuzzy-search keybind
nnoremap <C-f> :FuzzyOpen<CR>

"Map Alt+Arrows to move lines
nnoremap <C-k> :m-2 <CR>==
nnoremap <C-j> :m+ <CR>==
inoremap <C-k> :m-2 <CR>==gi
inoremap <C-j> :m+ <CR>==gi
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv

"Ctrl-Space to use clang-format
nnoremap <C-Space> :ClangFormat<CR>
vnoremap <C-Space> :ClangFormat<CR>

"Alias the prettier for the current buffer to 'Prettier'
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"Use the clipboard as default register
set clipboard=unnamedplus
set nocp
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
syntax enable

"Exclude temp files from autocompletion
set wildignore+=*.o,*.gcno,*.gcda

set number
"set colorcolumn=80
set scrolloff=999

nnoremap <Up> <Right>
nnoremap <Right> <Down>
nnoremap <Down> <Left>
nnoremap <Left> <Up>

nnoremap T :tabnew <cr>
nnoremap H :tabprev <cr>
nnoremap L :tabnext <cr>


"nnoremap <Up><Up><Down><Down><Left><Right><Left><Right>ba<space> :wq<CR>
"nnoremap <Up><Up><Down><Down><Left><Right><Left><Right>ba<ENTER> :wq<CR>

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

" Nerd tree toggle
nmap <C-b> :NERDTreeToggle<CR>
" Nerd tree Mirror
nmap <C-m> :NERDTreeMirror<CR>
" Nerd Tree ignore files
let NERDTreeIgnore=['\.o$', '\.gcno$', '\.gcda$']

" after a re-source, fix syntax matching issues (concealing brackets):
"if exists('g:loaded_webdevicons')
"    call webdevicons#refresh()
"endif

" iamcco/markdown-preview/nvim
let g:mkdp_markdown_css='/home/krapaince/.config/nvim/github-markdown.css'


" Show FZF when pressing ctrl-p
noremap <c-p> :call fzf#vim#files('', fzf#vim#with_preview('right'))<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore deps -g ""'
" Fzf search in file
nnoremap / :BLines<CR>
" Search in current project
nnoremap <c-j> :Ag<CR>
