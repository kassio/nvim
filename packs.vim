packadd minpac

call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

if has('nvim')
  call minpac#add('kassio/neoterm')
  call minpac#add('Shougo/deoplete.nvim')
  call minpac#add('Shougo/neco-vim', { 'type': 'opt' })
  call minpac#add('fishbullet/deoplete-ruby', { 'type': 'opt' })
end

" Theme
call minpac#add('mhartington/oceanic-next', { 'type': 'opt' })

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

" Markdown
call minpac#add('tpope/vim-markdown')

" Ruby
call minpac#add('vim-ruby/vim-ruby')
call minpac#add('Keithbsmiley/rspec.vim', { 'type': 'opt' })
call minpac#add('sunaku/vim-ruby-minitest', { 'type': 'opt' })
call minpac#add('slim-template/vim-slim')
call minpac#add('tpope/vim-haml')

" Tomdoc
call minpac#add('kassio/tomdoc.vim', { 'type': 'opt' })

" Update packages
command! PackUpdate call pack#update()
