# vimfiles

* Author: Kassio Borges <<kassioborgesm@gmail.com>>
* Since: 2011/02

<b>All this configurations was created and tested on mac & linux.</b>

## Download

        git clone git://github.com/kassio/vimfiles.git ~/.vim

## Setup

* install [vundle](https://github.com/gmarik/vundle) to manage all plugins:

        git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
        vim +BundleInstall +quit

* If your vim version < 7.4 so you'll need the `.vimrc` in you $HOME

        ln -s $HOME/.vim/vimrc $HOME/.vimrc

## Upgrade vim

* Dependences: curl

        $HOME/.vim/upgrade

## Files that you should to read

* vimrc # Vim customizations
* vundle.vim # Plugins list
* plugins/* # Plugins' customizations
