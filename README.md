# vimfiles

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/kassio/vimfiles/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

* Author: Kassio Borges <<kassioborgesm@gmail.com>>
* Since: 2011/02

<b>All this configurations was created and tested on mac & linux.</b>

## Download

        git clone git://github.com/kassio/vimfiles.git ~/.vim

## Setup

* If your vim version < 7.4 so you'll need the `.vimrc` in you $HOME

        ln -s $HOME/.vim/vimrc $HOME/.vimrc

* Install NeoBundle and all bundles:

	cd $HOME/.vim && ./setup

## Files you should to read

* vimrc         # Vim customizations
* neobundle.vim # Plugins list

## Plugins customizations

All the plugins customizations are located on `plugin` folder.

## Snippets

It's being used `neosnippets` and all my snippets are located on `snippets`
folder, the helper functions are located on `autoload/helper.vim`
