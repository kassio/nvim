function! git#restore(...) abort
  if a:0 && (a:1 ==# '%' || a:1 ==# '')
    exec '!git restore ' . expand('%:p')
  else
    exec '!git restore ' . a:1
  end
  edit
endfunction

function! git#remote(...)
  let l:file = expand('%')
  let l:remote = trim(system('git remote get-url origin'))
  let l:remote = substitute(l:remote, '^git@', 'https://', '')
  let l:remote = substitute(l:remote, '\.git$', '', '')

  if a:0 > 0 && a:1 =~# '^l\(ine\)\?' " last commit in current line
    let l:line = line('.')
    let l:ref = trim(system(printf(
          \   'git blame %s -L %s,%s | cut -f 1 -d " "',
          \   l:file,
          \   l:line,
          \   l:line
          \ )))
  else " branch
    let l:ref = trim(system('git symbolic-ref --short HEAD'))
  end

  call system(printf(
        \   'open %s',
        \   printf('%s/blob/%s/%s', l:remote, l:ref, l:file
        \ )))
endfunction
