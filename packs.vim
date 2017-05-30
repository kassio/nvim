if has('nvim')
  command! Pupgrade PlugClean! | PlugUpgrade | PlugUpdate
else
  command! Pupgrade PlugUpgrade | PlugUpdate
end

call plug#begin(expand('~/.config/nvim/_packs'))

if has('nvim')
  Plug 'https://github.com/kassio/neoterm.git'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/neco-vim', { 'for': ['vim'] }
  Plug 'fishbullet/deoplete-ruby', { 'for': ['ruby', 'eruby'] }
end

" Theme
Plug 'mhartington/oceanic-next'

" Linting
Plug 'benekastah/neomake'

" Search/replace/text manipulation
Plug 'vim-scripts/vis'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'

" Surrounding
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user'

" File tree
Plug 'scrooloose/nerdtree', { 'on': ['NERDTree', 'NERDTreeToggle', 'NERDTreeMirror', 'NERDTreeFind'] }

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Comments
Plug 'tpope/vim-commentary'

" Snippets
Plug 'sirver/ultisnips'

" Test runner
Plug 'janko-m/vim-test'

" Markdown
Plug 'tpope/vim-markdown', { 'for': ['markdown'] }

" HTML, javascript, css, scss, less
Plug 'othree/html5.vim', { 'for': ['html', 'eruby'] }
Plug 'othree/yajs.vim', { 'for': ['javascript', 'html', 'eruby'] }
Plug 'mxw/vim-jsx'

" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'eruby'] }
Plug 'Keithbsmiley/rspec.vim', { 'for': ['ruby'] }
Plug 'sunaku/vim-ruby-minitest', { 'for': ['ruby'] }

" Elixir
Plug 'elixir-lang/vim-elixir', { 'for': ['elixir', 'eelixir'] }

" Tomdoc
Plug 'kassio/tomdoc.vim', { 'for': ['ruby', 'javascript'] }

call plug#end()
