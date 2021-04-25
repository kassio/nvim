function! git#restore(...) abort
  if a:0 && (a:1 ==# '%' || a:1 ==# '')
    exec '!git restore ' . expand('%:p:.')
  else
    exec '!git restore ' . a:1
  end
  edit
endfunction

function! git#remote()
  let l:ref = trim(system('git symbolic-ref --short HEAD'))

  call s:open_remote(l:ref, expand('%:.'), line('.'))
endfunction

function! git#remote_master()
  call s:open_remote('master', expand('%:.'), line('.'))
endfunction

function! git#remote_commit()
  let l:file = expand('%:.')
  let l:line = line('.')
  let l:Fn = { _, data -> s:open_remote(trim(data[0]), l:file, l:line) }

  call jobstart(printf(
        \ 'git blame %s -L %s,%s | cut -f 1 -d " "',
        \ l:file,
        \ l:line,
        \ l:line
        \ ),
        \ {
        \   'on_stdout': l:Fn,
        \   'stdout_buffered': v:true
        \ })
endfunction

function! s:open_remote(ref, file, line)
  let l:remote = trim(system('git remote get-url origin'))
  let l:remote = substitute(l:remote, '^git@', 'https://', '')
  let l:remote = substitute(l:remote, '\.git$', '', '')
  let l:arg = printf('%s/blob/%s/%s#L%s', l:remote, a:ref, a:file, a:line)

  call jobstart(['open', l:arg])
endfunction
