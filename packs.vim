packadd minpac

call minpac#init()
call minpac#add('k-takata/minpac', { 'type': 'opt' })

call minpac#add('kassio/neoterm')
call minpac#add('janko-m/vim-test')

call minpac#add('Shougo/neco-vim')

call minpac#add('sheerun/vim-polyglot')
call minpac#add('prettier/vim-prettier', { 'do': 'yarn install' })

call minpac#add('neoclide/coc-sources')
call minpac#add('neoclide/coc-snippets')
call minpac#add('neoclide/coc-neco')
call minpac#add('neoclide/coc-html')
call minpac#add('neoclide/coc-tsserver')
call minpac#add('neoclide/coc-css')
call minpac#add('neoclide/coc-json')
call minpac#add('neoclide/coc-yaml')
call minpac#add('neoclide/coc.nvim', { 'rev': '*', 'do': { -> pack#coc_install() } })

" Theme
call minpac#add('joshdick/onedark.vim')

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
call minpac#add('justinmk/vim-dirvish')

" FZF improvements
call minpac#add('junegunn/fzf.vim')

" Git
call minpac#add('tpope/vim-fugitive')
call minpac#add('mhinz/vim-signify')
call minpac#add('rhysd/git-messenger.vim')

" Comments
call minpac#add('tpope/vim-commentary')

" Snippets
call minpac#add('sirver/ultisnips')

" Tomdoc
call minpac#add('kassio/tomdoc.vim', { 'type': 'opt' })

" Match pairs
call minpac#add('andymass/vim-matchup')

" Update packages
command! -bang PackUpdate call pack#update(<bang>0)
