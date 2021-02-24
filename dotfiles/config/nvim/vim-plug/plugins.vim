" {{@@ header() @@}}

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'

Plug 'rhysd/vim-clang-format'

Plug 'mhinz/vim-startify' " Start menu
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'norcalli/nvim-colorizer.lua' " Highlighter color code
Plug 'RRethy/vim-illuminate'
Plug 'vim-airline/vim-airline'
Plug 'Krapaince/vim-code-dark'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'

Plug 'preservim/nerdtree'
Plug 'kevinhwang91/rnvimr' " Ranger in vim

Plug 'tpope/vim-commentary'
Plug 'vim-scripts/vim-stay' " Save cursor position and folds when closing file
Plug 'Konfekt/FastFold'

Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'junegunn/fzf', { 'dir':'~/.fzf','do':'./install --all' }
Plug 'junegunn/fzf.vim',

Plug 'tpope/vim-surround' " Change surround character

Plug 'camspiers/animate.vim'

Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

Plug 'psliwka/vim-smoothie'

Plug 'ntpeters/vim-better-whitespace'

Plug 'wesQ3/vim-windowswap'

Plug 'AndrewRadev/tagalong.vim'

let g:vimspector_enable_mappings = 'HUMAN'
Plug 'puremourning/vimspector'

Plug 'vim-scripts/DrawIt'

call plug#end()
