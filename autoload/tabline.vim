function! tabline#update()
  let tabline = '%#TabLine#'

  let g:tabs = map(range(tabpagenr('$')), 'v:val + 1')
  let g:current_tab = tabpagenr()

  if g:current_tab > 1
    let g:ordered_tabs = g:tabs[g:current_tab-1:-1] + g:tabs[0:g:current_tab-2]
  else
    let g:ordered_tabs = g:tabs
  end

  for tabnr in g:ordered_tabs
    let tabline .= '%'.tabnr.'T'

    if g:current_tab == tabnr
      let tabline .=
            \   '%0.50(%#TabLineSel#'
            \ . tabline#label(tabnr)
            \ . '%)'
            \ . '%#TabLine#'
    elseif index(g:ordered_tabs, tabnr) == 3
      let tabline .= '%<'
    else
      let tabline .= tabline#label(tabnr)
    end
  endfor

  return tabline
endfunction

function! tabline#label(tabnr)
  return printf(' %d %s ', a:tabnr, s:fname(a:tabnr))
endfunction

function! s:fname(tabnr)
  let buflist = tabpagebuflist(a:tabnr)
  let winnr = tabpagewinnr(a:tabnr)
  let bufnr = buflist[winnr - 1]
  let bufname = getbufvar(bufnr, 'term_title', bufname(buflist[winnr - 1]))

  if len(bufname)
    return get(split(bufname, '/'), -1)
  else
    return '[No Name]'
  end
endfunction
