aug delete_fugitive_buffers
  au!
  au BufReadPost fugitive://* set bufhidden=delete
aug END

command! -nargs=+ G execute 'Git ' . <q-args>
command! -nargs=+ Gco call git#checkout(<q-args>)
command! Ghome call system('git home')
command! Gwork call system('git work')
