function! gem_tags#exec(command)
  if filereadable('tags.gems')
    let &l:tags='tags.gems'
    execute a:command . ' ' . expand('<cword>')
    let &l:tags=&g:tags
  else
    echo 'No tags.gems found.'
  end
endfunction

function! gem_tags#complete(scope)
  if a:scope != 'default'
    return "\<c-x>\<c-]>"
  else
    let &l:tags='tags.gems'
    return "\<c-x>\<c-]>"
  end
endfunction
