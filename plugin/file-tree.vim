aug user:file-tree
  au!
  au Filetype NvimTree set nonu nornu
aug END

nnoremap <leader>p :NvimTreeToggle<CR>
nnoremap <leader>fl :NvimTreeFindFile<CR>
