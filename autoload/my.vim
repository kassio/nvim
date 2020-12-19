function my#bufreadpost()
  call buffer#restore_cursor_position()
  call my#setup#textobj()
endfunction

function! my#current_highlight()
  if !exists("*synstack")
    return
  endif

  echo map(synstack(line('.'), col('.')), { i, val ->
        \   synIDattr(val, 'name') . ' → ' . synIDattr(synIDtrans(val), 'name')
        \ })
endfunction
