if has('vim_starting')
  set runtimepath+=~/.nvim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.nvim/bundle'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Tools
NeoBundle 'kassio/vim-session_manager'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'

" Neovim
NeoBundle 'benekastah/neomake'

" textobjs
NeoBundle 'kana/vim-textobj-user'

" Snippets
NeoBundle 'sirver/ultisnips'

" Tomdoc
NeoBundle 'wellbredgrapefruit/tomdoc.vim'

" HTML, javascript
NeoBundleLazy 'othree/html5.vim', {
      \ 'autoload': { 'filetypes': ['html'] }
      \ }
NeoBundleLazy 'jelera/vim-javascript-syntax', {
      \ 'autoload': { 'filetypes': ['javascript', 'html'] }
      \ }
NeoBundleLazy 'guileen/simple-javascript-indenter', {
      \ 'autoload': { 'filetypes': ['javascript', 'html'] }
      \ }

" react.js
NeoBundle 'mxw/vim-jsx'

" Ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundleLazy 'Keithbsmiley/rspec.vim', {
      \ 'autoload': { 'filetypes': ['ruby'] }
      \ }

" Elixir
NeoBundleLazy 'elixir-lang/vim-elixir', {
      \ 'autoload': { 'filetypes': ['elixir'] }
      \ }

" Puppet
NeoBundleLazy 'rodjek/vim-puppet', {
      \ 'autoload': { 'filetypes': ['puppet'] }
      \ }

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
