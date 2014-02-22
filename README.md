# vimfiles

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/kassio/vimfiles/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

* Author: Kassio Borges <<kassioborgesm@gmail.com>>
* Since: 2011/02

<b>All this configurations was created and tested on mac & linux.</b>

## Download

        git clone git://github.com/kassio/vimfiles.git ~/.vim

## Setup

* install [neobundle](https://github.com/Shougo/neobundle.vim) to manage all
plugins:

        mkdir -p ~/.vim/bundle
        git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
        vim +BundleUpdate +qall

* If your vim version < 7.4 so you'll need the `.vimrc` in you $HOME

        ln -s $HOME/.vim/vimrc $HOME/.vimrc

## Files you should to read

* vimrc         # Vim customizations
* neobundle.vim # Plugins list

## Plugins customizations

All the plugins customizations are located on `plugin` folder.

## Snippets

It's being used `neosnippets` and all my snippets are located on `snippets`
folder, the helper functions are located on `autoload/my_snippet.vim`
