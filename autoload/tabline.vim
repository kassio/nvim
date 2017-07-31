function! tabline#update() abort
  let l:tabs = map(range(tabpagenr('$')), { tab -> tab + 1 })
  let l:tab = tabpagenr()
  let l:tab_index = index(l:tabs, l:tab)
  let l:tabs_before = l:tab_index > 0 ? l:tabs[0:l:tab_index-1] : []
  let l:tabs_after = l:tab_index < tabpagenr('$') ? l:tabs[l:tab_index+1:-1] : []

  let l:current = tabline#label(l:tab)

  let l:labels_before = map(copy(l:tabs_before), 'tabline#label(v:val)')
  let l:text_before = join(l:labels_before, '')
  let l:labels_after = map(copy(l:tabs_after), 'tabline#label(v:val)')
  let l:text_after = ''

  if !empty(l:text_before) && len(l:text_before) - (3*len(l:labels_before)) > &columns
    let l:text_before = '%<(' . l:text_before . '%)'
    let l:text_after = join(l:labels_after, '')
  elseif !empty(l:labels_after)
    let l:current_len = len(l:text_before) + len(l:current) - (3*(len(l:labels_before) + 1))
    let l:next_after = []
    let l:breaked = 0

    for label in l:labels_after
      let label_len = len(label) - 3

      if l:current_len + label_len >= &columns
        let l:breaked = 1
        break
      else
        call add(l:next_after, label)
        let l:current_len += label_len
      end
    endfor

    let l:text_after = join(l:next_after, '')
    if l:breaked
      let l:text_after .= '%<(' . join(l:labels_after[index(l:labels_after, label):-1], '') . '%)'
    end
  end

  return
        \   '%#TabLine#'
        \ . l:text_before
        \ . '%0.50(%#TabLineSel#' . l:current . '%*%)'
        \ . l:text_after
        \ . '%#TabLineFill#'
endfunction

function! tabline#label(tabnr) abort
  return printf('%%%dT %d %s ', a:tabnr, a:tabnr, s:fname(a:tabnr))
endfunction

function! s:fname(tabnr) abort
  let l:buflist = tabpagebuflist(a:tabnr)
  let l:winnr = tabpagewinnr(a:tabnr)
  let l:bufnr = l:buflist[l:winnr - 1]
  let l:bufname = getbufvar(l:bufnr, 'term_title', bufname(l:buflist[l:winnr - 1]))

  if len(l:bufname)
    return get(split(l:bufname, '/'), -1)
  else
    return '[No name]'
  end
endfunction
