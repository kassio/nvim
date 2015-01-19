# vimfiles

<b>**NEVER** use this as your personal setup! It's not stable for distribution.</b>

## Installing vim

```console
$HOME/.vim/bin/install
```

## Setting up this configs

### Download it

```console
git clone git://github.com/kassio/vimfiles.git ~/.vim
```

### Install vim plugins:

```console
$HOME/.vim/bin/bundle
```

## Vim with zsh(on Mac, at least)

In a sunny day I tried to run `ruby` from my vim with: `:!ruby %` and then I
figured out that the vim was using the wrong `ruby`.

[To fix it](https://coderwall.com/p/w7fnxa):

edit `/etc/zshenv` and comment it:

```console
# system-wide environment settings for zsh(1)
#if [ -x /usr/libexec/path_helper ]; then
  #eval `/usr/libexec/path_helper -s`
#fi
```
