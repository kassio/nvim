" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

aug user:completion
  autocmd!
  autocmd FileType
        \ *rb, *vim
        \ lua require'completion'.on_attach()
aug END
