if exists('b:fugitive_setup_loaded')
  finish
endif
let b:fugitive_setup_loaded=1

aug delete_fugitive_buffers
  au!
  au BufReadPost fugitive://* set bufhidden=delete
aug END
