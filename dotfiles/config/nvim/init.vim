" {{@@ header() @@}}

source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/vim-plug/plugins.vim

" Plug config
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/vim-code-dark.vim
source $HOME/.config/nvim/plug-config/vista.vim
source $HOME/.config/nvim/plug-config/airline.vim
source $HOME/.config/nvim/plug-config/vim-cpp-enhanced-highlight.vim
source $HOME/.config/nvim/plug-config/vim-dadbod-ui.vim
source $HOME/.config/nvim/plug-config/git-messenger.vim
source $HOME/.config/nvim/plug-config/vim-clang-format.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/nerdtree.vim
source $HOME/.config/nvim/plug-config/markdown-preview.vim
source $HOME/.config/nvim/plug-config/vim-commentary.vim
source $HOME/.config/nvim/plug-config/vim-illuminate.vim
source $HOME/.config/nvim/plug-config/rnvimr.vim
source $HOME/.config/nvim/plug-config/vimspector.vim
source $HOME/.config/nvim/plug-config/vim-easy-align.vim
source $HOME/.config/nvim/plug-config/animate.vim

luafile $HOME/.config/nvim/lua/plug-colorizer.lua

" Snippet
source $HOME/.config/nvim/snippet.vim

" Keybindings
source $HOME/.config/nvim/keys/mappings.vim
