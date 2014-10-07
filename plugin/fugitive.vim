aug delete_fugitive_buffers
  au!
  au BufReadPost fugitive://* set bufhidden=delete
aug END

command! -nargs=+ G execute 'Git ' . <q-args>
command! -nargs=+ Gco exec 'Git checkout ' . <q-args>
