function! fold#comments() abort
  try
    let l:old_fdm = &foldmethod
    let &l:foldmethod = 'expr'
    set foldexpr=CommentFoldLevel(v:lnum)
    set foldenable
    %foldclose
    let &l:foldmethod = l:old_fdm
  catch /E490/
    " noop
  endtry
endfunction

function! CommentFoldLevel(lnum)
  return join(color#names(a:lnum, 1), '#') =~? 'comment'
endfunction
