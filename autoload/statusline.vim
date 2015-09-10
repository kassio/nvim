function! statusline#neomake()
  let loclist = filter(getloclist(0), "v:val.type =~ 'W\\|E' ")

  if empty(loclist)
    return ""
  else
    let type = loclist[0].type
    let first_line = loclist[0].lnum
    let counter = len(loclist)

    return printf(" %s: %s(%s) ", type, first_line, counter)
  end
endfunction

function! statusline#bufnum()
  return expand('%:t') =~ 'NERD_tree' ? '' : bufnr('%') . ' |'
endfunction

function! statusline#modified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! statusline#readonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! statusline#filename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ ('' != statusline#readonly() ? statusline#readonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != statusline#modified() ? ' ' . statusline#modified() : '')
endfunction

function! statusline#fileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! statusline#filetype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! statusline#fileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! statusline#stats()
  if expand('%:t') =~ 'NERD_tree'
    return ''
  else
   let curpos = getcurpos()
   return printf('%d,%d/%d', curpos[2], curpos[1], line('$'))
  end
endfunction

function! statusline#mode()
  let fname = expand('%:t')
  return fname == 'ControlP' ? 'CtrlP' :
        \ fname =~ 'NERD_tree' ? '' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! statusline#nerdtree()
  if expand('%:t') =~ 'NERD_tree'
    return lightline#concatenate([strpart(matchstr(getline('.'), '\s\zs\w\(.*\)'), 0, 28)], 0)
  else
    return ''
  end
endfunction

function! statusline#ctrlp()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([
          \ g:lightline.ctrlp_prev,
          \ g:lightline.ctrlp_item,
          \ g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

function! statusline#ctrlp_main(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! statusline#ctrlp_prog(str)
  return lightline#statusline(0)
endfunction
