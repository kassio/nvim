function! buffer#restore_cursor_position() abort
  if !exists('b:open_at_first_line') &&
        \ line("'\"") > 0 &&
        \ line("'\"") <= line('$') |
    execute 'normal! g`"'
  else
    execute 'normal! gg0'
  end
endfunction

function! buffer#kill() abort
  if &filetype =~? 'neoterm'
    close
  else
    bwipeout!
  end
endfunction

function! buffer#kill_all() abort
  let l:buffers = buffer#user_buffers({ bufid ->
        \ getbufvar(bufid, '&ft') != 'neoterm'
        \ })

  if !empty(l:buffers)
    exec 'bw! '. join(l:buffers, ' ')
  end
endfunction

function! buffer#kill_others() abort
  let l:buffers = buffer#user_buffers({ bufid ->
        \ bufid != bufnr('%')
        \ })

  if !empty(l:buffers)
    exec 'bw! '. join(l:buffers, ' ')
  end
endfunction

function! buffer#kill_unlisted() abort
  let l:buffers = buffer#user_buffers({ bufid ->
        \   !buflisted(bufid) ||
        \   !bufloaded(bufid) ||
        \   getbufvar(bufid, '&bt') != ''
        \ })

  if !empty(l:buffers)
    exec 'bw! '. join(l:buffers, ' ')
  end
endfunction

function! buffer#user_buffers(...) abort
  let l:ExtraFilters = a:0 ? a:1 : { bufid -> v:true }
  let l:buffers = range(1, bufnr('$'))

  return filter(copy(l:buffers), { _, bufid ->
        \   bufexists(bufid) &&
        \   l:ExtraFilters(bufid)
        \ })
endfunction

function! buffer#trim() abort
  let l:hlsearch = &hlsearch
  setlocal nohlsearch
  call preserve#preserve('silent %s/\v\s+$//e')
  call preserve#preserve('silent %s/\v($\n\s*)+%$//e')
  let &hlsearch = l:hlsearch
endfunction

function! buffer#autosave() abort
  if file_readable(expand('%')) && &modifiable
    call buffer#trim()
    write!
  end
endfunction

function! buffer#reset_synmaxcol() abort
  let l:maxcol = max(map(range(1, line('$')), "col([v:val, '$'])"))
  let &synmaxcol = l:maxcol < 200 ? 200 : l:maxcol
endfunction

function! buffer#longest_line()
  let lines = {}
  let line_nr = 1
  for line in getline(1,'$')
    let lines[len(line)] = { 'content': line, 'nr': line_nr }
    let line_nr += 1
  endfor

  let size = max(keys(lines))
  let line = lines[size]

  echo printf(
        \ "line: %s | size: %s | content: '%s'",
        \ line['nr'],
        \ size,
        \ line['content'])
endfunction
