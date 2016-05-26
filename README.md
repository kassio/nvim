# nvimfiles

<b>**NEVER** use this as your personal setup! It's not stable for distribution.</b>

## Installing neovim

### Dependencies
```console
# python clients
pip install neovim -q
pip3 install neovim-remote -q

# lua
brew install lua
```

### neovim
```
brew install neovim
```

## Update neovim HEAD

```console
brew reinstall neovim --HEAD
```

## Setting up

### neovim

```console
git clone git://github.com/kassio/nvimfiles.git ~/.config/nvim
```

#### linking vim configs with neovim

```console
ln -sf ~/.config/nvim ~/.vim
```

### installing vim without nvim

```console
git clone git://github.com/kassio/nvimfiles.git ~/.vim
```

## Plugins

```console
nvim +PlugInstall
```
