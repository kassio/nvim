function! gem_tags#exec(command)
  if filereadable('tags.gems')
    let &l:tags='tags.gems'
    execute a:command . ' ' . expand('<cword>')
    let &l:tags=&g:tags
  else
    echo 'No tags.gems found.'
  end
endfunction
