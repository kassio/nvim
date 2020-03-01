let s:cancel = { 'desc': 'Cancel' }

let s:move = { 'desc': 'Move (rename)' }
function! s:move.cmd(path)
  let l:destination = input('Destination: ', '', 'file')
  call system(printf('mv %s %s/%s', a:path, expand('%'), l:destination))
endfunction

let s:delete = { 'desc': 'Delete' }
function! s:delete.cmd(path)
  call system(printf('rm -rf %s', a:path))
endfunction

let s:commands = {
      \  'q': s:cancel,
      \  'm': s:move,
      \  'd': s:delete
      \ }

function! s:isActionable(choice)
  return a:choice !=# 'q' && index(keys(s:commands), a:choice) > -1
endfunction

function! user#dirvish#exec(path) abort
  echo printf(">> %s\n\n", a:path)
  for l:key in keys(s:commands)
    echo printf('[%s] %s', l:key, s:commands[key].desc)
  endfor
  echo "\nAction: "

  let l:choice = nr2char(getchar())
  echo l:choice

  if s:isActionable(l:choice)
    let l:Fn = s:commands[l:choice].cmd
    call l:Fn(a:path)
    Dirvish %
  end

  " call feedkeys('<cr>')
endfunction
