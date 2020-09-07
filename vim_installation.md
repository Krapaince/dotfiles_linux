Install `neovim` packgae.
Install [`vim-plug`](https://github.com/junegunn/vim-plug) for neovim:
```bash
sh -c 'curl -fLo "/home/krapaince/.local/share"/nvim/site/autoload/plug.vim --create-dirs        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Open `nvim` and install the plugin with the following command
```
:PlugInstall
```
Install `coc-snippets`
```
:CocInstall coc-snippets
```
Install `xclip` to copy in/out of vim
```bash
yay xclip
1
```
