syntax enable                           " Enables syntax highlighing
set nowrap                              " Display long lines as just one line

set foldmethod=syntax                   " Use syntax-based folding
set foldlevelstart=99

set wildignorecase                      " Make filenames autocompletion case-insensitive

set ignorecase                          " Make search case insensitive if all lowercase

set termguicolors                       " Set colorscheme

set timeoutlen=200                      " Shorten key sequence timeout

set clipboard=unnamedplus               " Copy paste between vim and everything else
set nocp

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab                           " Converts tabs to spaces
set smartcase
set autoindent

set number                              " Line numbers
set scrolloff=999
"set cursorline                          " Enable highlighting of the current line

"Exclude temp files from autocompletion
set wildignore+=*.o,*.gcno,*.gcda

set t_Co=256
