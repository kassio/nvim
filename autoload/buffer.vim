function! buffer#restore_cursor_position() abort
  if !exists('b:open_at_first_line') &&
        \ line("'\"") > 0 &&
        \ line("'\"") <= line('$') |
    execute 'normal! g`"'
  end
endfunction

function! buffer#kill() abort
  if &filetype =~? 'nerdtree' || &filetype =~? 'neoterm'
    close
  else
    bwipeout!
  end
endfunction

function! buffer#killall() abort
  let l:buffers = buffer#user_buffers()

  if !empty(l:buffers)
    exec 'bw! '. join(l:buffers, ' ')
  end
endfunction

function! buffer#wipeall() abort
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
        \   bufname(bufid) !~# 'NERD_tree' &&
        \   bufname(bufid) !~# 'term:.*' &&
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
  if &modifiable
    call buffer#trim()
    write!
  end
endfunction

function! buffer#reset_synmaxcol() abort
  let l:maxcol = max(map(range(1, line('$')), "col([v:val, '$'])"))
  let &synmaxcol = l:maxcol < 200 ? 200 : l:maxcol
endfunction
