# vimfiles

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/kassio/vimfiles/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

* Author: Kassio Borges <<kassioborgesm@gmail.com>>
* Since: 2011/02

<b>All this configurations was created and tested on mac & linux.</b>

## Download

        git clone git://github.com/kassio/vimfiles.git ~/.vim

## Setup

* install [vundle](https://github.com/gmarik/vundle) to manage all plugins:

        git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
        vim +BundleUpdate +qall

* If your vim version < 7.4 so you'll need the `.vimrc` in you $HOME

        ln -s $HOME/.vim/vimrc $HOME/.vimrc

## Files that you should to read

* vimrc      # Vim customizations
* vundle.vim # Plugins list
* plugins/*  # Plugins' customizations
