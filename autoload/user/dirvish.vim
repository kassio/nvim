let s:cancel = { 'desc': 'Cancel', 'option': 'q' }

let s:move = { 'desc': 'Move (rename)', 'option': 'm' }
function! s:move.cmd(path)
  let l:destination = input('Destination: ', '', 'file')
  call system(printf('mv %s %s', a:path, l:destination))
endfunction

let s:delete = { 'desc': 'Delete', 'option': 'd' }
function! s:delete.cmd(path)
  call system(printf('rm -rf %s', a:path))
endfunction

let s:commands = [
      \   s:cancel,
      \   s:move,
      \   s:delete
      \ ]

function! s:isActionable(choice)
  return a:choice != s:cancel.option &&
        \ index(map(copy(s:commands), { _, command -> command.option }), a:choice) > -1
endfunction

function! user#dirvish#exec(path) abort
  echo printf(">> %s\n\n", a:path)
  echo join(map(copy(s:commands), { _, command ->
        \   printf('[%s] %s', command.option, command.desc)
        \ }), "\n")
  echo "\nWhat you wanna do?"

  let l:valid_choices = map(copy(s:commands), { _, command -> command.option })
  let l:choice = nr2char(getchar())

  if s:isActionable(l:choice)
    let l:Fn = s:commands[l:choice - 1].cmd
    call l:Fn(a:path)
    Dirvish %
  end

  call feedkeys('<cr>')
endfunction
