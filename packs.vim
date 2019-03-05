packadd minpac

call minpac#init()
call minpac#add('k-takata/minpac', { 'type': 'opt' })

call minpac#add('kassio/neoterm')

call minpac#add('Shougo/neco-vim')

call minpac#add('neoclide/coc.nvim', { 'rev': '*', 'do': { -> coc#util#install()} })
call minpac#add('neoclide/coc-sources')
call minpac#add('neoclide/coc-snippets')
call minpac#add('neoclide/coc-neco')
call minpac#add('neoclide/coc-html')
call minpac#add('neoclide/coc-tsserver')
call minpac#add('neoclide/coc-css')
call minpac#add('neoclide/coc-solargraph')
call minpac#add('neoclide/coc-yaml')

" Theme
call minpac#add('chriskempson/base16-vim', { 'type': 'opt' })

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

" HTML, javascript, css, scss, less
call minpac#add('othree/html5.vim')
call minpac#add('mxw/vim-jsx')
call minpac#add('othree/yajs.vim')
call minpac#add('othree/es.next.syntax.vim')

" Tomdoc
call minpac#add('kassio/tomdoc.vim', { 'type': 'opt' })

" Run tests from vim
call minpac#add('janko-m/vim-test')

" Elixir
call minpac#add('elixir-editors/vim-elixir')

" Update packages
command! -bang PackUpdate call pack#update(<bang>0)
