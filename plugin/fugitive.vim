if exists('b:fugitive_setup_loaded')
  finish
endif

aug delete_fugitive_buffers
  au!
  au BufReadPost fugitive://* set bufhidden=delete
aug END
