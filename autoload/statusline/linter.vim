function! statusline#linter#ale(scope)
  let l:loclist = filter(getloclist(0), { _, item ->
        \    type(item) == v:t_dict &&
        \     item.type == a:scope &&
        \     item.bufnr == winbufnr(winnr())
        \  })

  return len(l:loclist)
endfunction

function! statusline#linter#coc(scope) abort
  let info = get(b:, 'coc_diagnostic_info', {})
  let key = a:scope ==# 'W' ? 'warning' : 'error'

  return get(info, key, 0)
endfunction
