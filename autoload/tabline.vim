function! tabline#update()
  let tabline = ''

  for i in range(tabpagenr('$'))
    let tabnr = i + 1
    if tabpagenr() == tabnr
      let tabline .=
            \   '%#TabLine#'
            \ . '%'.tabnr.'T'
            \ . '%#TabLineSel#'
            \ . tabline#label(tabnr)
            \ . '%#TabLine#'
    else
      let tabline .=
            \   '%#TabLine#'
            \ . '%'.tabnr.'T'
            \ . tabline#label(tabnr)
            \ . '%#TabLine#'
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
