function! tabline#update()
  let tabs = map(range(tabpagenr('$')), 'v:val + 1')
  let tab = tabpagenr()
  let tab_index = index(tabs, tab)
  let tabs_before = tab_index > 0 ? tabs[0:tab_index-1] : []
  let tabs_after = tab_index < tabpagenr('$') ? tabs[tab_index+1:-1] : []

  let current = tabline#label(tab)

  let labels_before = map(copy(tabs_before), 'tabline#label(v:val)')
  let text_before = join(labels_before, '')
  let labels_after = map(copy(tabs_after), 'tabline#label(v:val)')
  let text_after = ''

  if !empty(text_before) && len(text_before) - (3*len(labels_before)) > &columns
    let text_before = '%<(' . text_before . '%)'
    let text_after = join(labels_after, '')
  elseif !empty(labels_after)
    let current_len = len(text_before) + len(current) - (3*(len(labels_before) + 1))
    let next_after = []
    let breaked = 0

    for label in labels_after
      let label_len = len(label) - 3

      if current_len + label_len >= &columns
        let breaked = 1
        break
      else
        call add(next_after, label)
        let current_len += label_len
      end
    endfor

    let text_after = join(next_after, '')
    if breaked
      let text_after .= '%<(' . join(labels_after[index(labels_after, label):-1], '') . '%)'
    end
  end

  return
        \   '%#TabLine#'
        \ . text_before
        \ . '%0.50(%#TabLineSel#' . current . '%*%)'
        \ . text_after
        \ . '%#TabLineFill#'
endfunction

function! tabline#label(tabnr)
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
