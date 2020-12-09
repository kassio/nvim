function! s:ale_filter(scope)
  return filter(getloclist(0), { _, item ->
        \    type(item) == v:t_dict &&
        \     item.type == a:scope &&
        \     item.bufnr == winbufnr(winnr())
        \  })
endfunction

function! s:ale(scope)
  if a:scope ==# 'W'
    return len(s:ale_filter('W')) + len(s:ale_filter('I'))
  else
    return len(s:ale_filter(a:scope))
  end
endfunction

function! s:lsp(scope)
        " let sl.='%#MyStatuslineLSP#E:'
        " let sl.='%#MyStatuslineLSPErrors#%{luaeval("vim.lsp.diagnostic.get_count(vim.fn.bufnr('%'), [[Error]])")}'
        " let sl.='%#MyStatuslineLSP# W:'
        " let sl.='%#MyStatuslineLSPWarnings#%{luaeval("vim.lsp.diagnostic.get_count(vim.fn.bufnr('%'), [[Warning]])")}'

  if a:scope ==# 'W'
    return luaeval("vim.lsp.diagnostic.get_count(vim.fn.bufnr('%'), [[Error]])")
  else
    return luaeval("vim.lsp.diagnostic.get_count(vim.fn.bufnr('%'), [[Warning]])")
  end
endfunction

function! statusline#linter#total(scope)
  return s:ale(a:scope) + s:lsp(a:scope)
endfunction
