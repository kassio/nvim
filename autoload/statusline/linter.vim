function! s:ale(scope)
  return filter(getloclist(0), { _, item ->
        \    type(item) == v:t_dict &&
        \     item.type == a:scope &&
        \     item.bufnr == winbufnr(winnr())
        \  })
endfunction

function! statusline#linter#ale(scope)
  if a:scope ==# 'W'
    return len(s:ale('W')) + len(s:ale('I'))
  else
    return len(s:ale(a:scope))
  end
endfunction

function! statusline#linter#coc(scope) abort
  let info = get(b:, 'coc_diagnostic_info', {})

  if a:scope ==# 'W'
    return get(info, 'warning', 0) + get(info, 'information', 0)
  else
    return get(info, 'error', 0)
  end
endfunction
