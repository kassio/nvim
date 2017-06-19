if exists('*minpac#init')
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  if has('nvim')
    call minpac#add('https://github.com/kassio/neoterm.git')
    call minpac#add('Shougo/deoplete.nvim', { 'do': {-> UpdateRemotePlugins} })
    call minpac#add('Shougo/neco-vim', { 'type': 'opt' })
    call minpac#add('fishbullet/deoplete-ruby', { 'type': 'opt' })
  end

  " Theme
  call minpac#add('mhartington/oceanic-next')

  " Linting
  call minpac#add('w0rp/ale')

  " Search/replace/text manipulation
  call minpac#add('vim-scripts/vis')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-abolish')

  " Surrounding
  call minpac#add('tpope/vim-surround')
  call minpac#add('wellle/targets.vim')
  call minpac#add('kana/vim-textobj-user')

  " File tree
  call minpac#add('scrooloose/nerdtree')

  " FZF improvements
  call minpac#add('junegunn/fzf.vim')

  " Git
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('mhinz/vim-signify')

  " Comments
  call minpac#add('tpope/vim-commentary')

  " Snippets
  call minpac#add('sirver/ultisnips')

  " Test runner
  call minpac#add('janko-m/vim-test')

  " Markdown
  call minpac#add('tpope/vim-markdown', { 'type': 'opt' })

  " HTML, javascript, css, scss, less
  call minpac#add('othree/html5.vim', { 'type': 'opt' })
  call minpac#add('othree/yajs.vim', { 'type': 'opt' })
  call minpac#add('mxw/vim-jsx')

  " Ruby
  call minpac#add('vim-ruby/vim-ruby', { 'type': 'opt' })
  call minpac#add('Keithbsmiley/rspec.vim', { 'type': 'opt' })
  call minpac#add('sunaku/vim-ruby-minitest', { 'type': 'opt' })

  " Elixir
  call minpac#add('elixir-lang/vim-elixir', { 'type': 'opt' })

  " Tomdoc
  call minpac#add('kassio/tomdoc.vim', { 'type': 'opt' })
endif

au Filetype vim packadd neco-vim
au Filetype ruby,eruby packadd deoplete-ruby
au Filetype markdown packadd vim-markdown
au Filetype html,eruby packadd html5.vim
au Filetype javascript,html,eruby,jsx packadd yajs.vim
au Filetype jsx packadd vim-jsx
au Filetype ruby,eruby packadd vim-ruby
au Filetype ruby packadd rspec.vim
au Filetype ruby packadd vim-ruby-minitest
au Filetype elixir,eelixir packadd vim-elixir
au Filetype ruby,javascript packadd tomdoc.vim

packloadall

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
