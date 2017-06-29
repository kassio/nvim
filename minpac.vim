packadd minpac

call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

if has('nvim')
  call minpac#add('https://github.com/kassio/neoterm.git')
  call minpac#add('Shougo/deoplete.nvim')
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

" Swift
call minpac#add('kballard/vim-swift')

" Tomdoc
call minpac#add('kassio/tomdoc.vim', { 'type': 'opt' })
