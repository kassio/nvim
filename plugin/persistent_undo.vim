set undofile undolevels=1000 undoreload=10000 undodir=~/.v_undo

function! PersistUndoTree()
  if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "", 0700)
  endif
endfunction

aug persist_undo
  au!
  au FileType gitcommit setlocal noundofile
  au BufWritePre * call PersistUndoTree()
aug END
