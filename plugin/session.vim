nnoremap <leader>ss :silent! !mkdir -p ._vim<cr>:call BeforeSaveSession() \| mksession! ._vim/session<cr>
nnoremap <leader>sl :source ._vim/session<cr>
nnoremap <leader>sd :exec "!rm ._vim/session"<cr>

function! BeforeSaveSession()
  if has('nvim') && exists(':TcloseAll')
    TcloseAll
  end
endfunction
