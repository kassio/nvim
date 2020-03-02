scriptencoding utf-8

let s:cancel = { 'desc': 'Cancel' }

let s:create = { 'desc': 'Create (touch)' }
function! s:create.cmd(_)
  let l:destination = input('Name: ', '', 'file')
  call system(printf('touch %s/%s', expand('%'), l:destination))
endfunction

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
      \  'a': s:create,
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
  echon "\n\nAction: "

  let l:choice = nr2char(getchar())
  redraw

  if s:isActionable(l:choice)
    let l:Fn = s:commands[l:choice].cmd
    call l:Fn(a:path)
    Dirvish %
  end

  call feedkeys('<cr>')
endfunction

function! user#dirvish#icon(path)
  if a:path[-1:] ==# '/'
    return ''
  else
    let l:file_icons = user#dirvish#icon#files()
    let l:extension_icons = user#dirvish#icon#extensions()
    let l:file = split(a:path, '\/')[-1]
    let l:extension = split(a:path, '[\./]')[-1]

    return get(l:file_icons, l:file,
          \ get(l:extension_icons, l:extension, ''))
  end
endfunction
