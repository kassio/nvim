command! FoldComments call s:fold_comments()

function! s:fold_comments()
  set foldmethod=expr
  set foldexpr=getline(v:lnum)=~'^\\s*'.&commentstring[0]
  set foldenable
  %foldclose
endfunction
