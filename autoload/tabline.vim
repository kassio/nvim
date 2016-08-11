function! tabline#update()
  let g:tabs = map(range(tabpagenr('$')), 'v:val + 1')
  let g:tab = tabpagenr()
  let g:tab_index = index(g:tabs, g:tab)
  let g:tabs_before = g:tab_index > 0 ? g:tabs[0:g:tab_index-1] : []
  let g:tabs_after = g:tabs[g:tab_index+1:-1]

  let g:current = tabline#label(g:tab, 1)

  let g:labels_before = map(copy(g:tabs_before), 'tabline#label(v:val, v:val == g:tab)')
  let g:text_before = join(g:labels_before, '')
  let g:labels_after = map(copy(g:tabs_after), 'tabline#label(v:val, v:val == g:tab)')

  if len(g:text_before) > &columns - len(g:current) - 1
    let g:text_before = '%<(' . g:text_before . '%)'
    let g:text_after = join(g:labels_after, '')
  else
    let g:current_len = len(g:text_before) + len(g:current) - (3*(len(g:labels_before)))
    let g:next_after = ''

    for label in g:labels_after
      let label_len = len(label) - 3

      if g:current_len + label_len >= &columns
        break
      else
        let g:next_after .= label
        let g:current_len += label_len
      end
    endfor

    let g:text_after = g:next_after . '%<(' . join(g:labels_after[index(g:labels_after, label):-1], '') . '%)'
  end

  return
        \   '%#TabLine#'
        \ . g:text_before
        \ . '%#TabLineSel#' . g:current . '%*'
        \ . g:text_after
        \ . '%#TabLineFill#'
endfunction

function! tabline#label(tabnr, current)
  return printf('%%%dT %d %s ', a:tabnr, a:tabnr, s:fname(a:tabnr))
endfunction

function! s:fname(tabnr)
  let buflist = tabpagebuflist(a:tabnr)
  let winnr = tabpagewinnr(a:tabnr)
  let bufnr = buflist[winnr - 1]
  let bufname = getbufvar(bufnr, 'term_title', bufname(buflist[winnr - 1]))

  if len(bufname)
    return get(split(bufname, '/'), -1)
  else
    return '[No name]'
  end
endfunction
