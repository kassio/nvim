let g:coc_global_extensions = [
      \ 'coc-explorer',
      \ 'coc-html',
      \ 'coc-tsserver',
      \ 'coc-css',
      \ 'coc-json',
      \ 'coc-yaml',
      \ 'coc-snippets',
      \ 'coc-ultisnips',
      \ 'coc-word',
      \ 'coc-tag',
      \ 'coc-solargraph',
      \ 'coc-go',
      \ 'coc-vimlsp',
      \ 'coc-markdownlint'
      \ ]
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Formatting selected code.
xmap <nowait> <leader>F <Plug>(coc-format-selected)
nmap <nowait> <leader>F <Plug>(coc-format-selected)

" Open command list
nnoremap  <leader>c :<c-u>CocCommand<cr>

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Explorer
nmap <leader>p :CocCommand explorer<cr>
nmap <leader>fl :execute printf("CocCommand explorer --no-toggle --reveal %s", expand('%:p'))<cr>
