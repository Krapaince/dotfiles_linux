"Configure Plug
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'

Plug 'rhysd/vim-clang-format'

Plug 'mhinz/vim-startify'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'RRethy/vim-illuminate'
Plug 'vim-airline/vim-airline'
Plug 'tomasiser/vim-code-dark'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'

Plug 'preservim/nerdtree'
Plug 'kevinhwang91/rnvimr'

Plug 'tpope/vim-commentary'
Plug 'vim-scripts/vim-stay' " Save cursor position and folds when closing file
Plug 'Konfekt/FastFold'



Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

Plug 'junegunn/fzf', { 'dir':'~/.fzf','do':'./install --all' }
Plug 'junegunn/fzf.vim',

" On-demand lazy load
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

Plug 'tpope/vim-surround'

Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'


Plug 'psliwka/vim-smoothie'

Plug 'ntpeters/vim-better-whitespace'

Plug 'wesQ3/vim-windowswap'

Plug 'AndrewRadev/tagalong.vim'

" Plug 'puremourning/vimspector'
" Plug 'airblade/vim-gitgutter'

call plug#end()
