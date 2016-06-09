function! tabline#update()
  let tabline = ''

  for i in range(tabpagenr('$'))
    let tabnr = i + 1
    if tabpagenr() == tabnr
      let tabline .=
            \   '%#StatusLine#'
            \ . '%'.tabnr.'T'
            \ . '%#SLModeNormal#'
            \ . tabline#label(tabnr)
            \ . '%#StatusLine#'
    else
      let tabline .=
            \   '%#StatusLine#'
            \ . '%'.tabnr.'T'
            \ . tabline#label(tabnr)
            \ . '%#StatusLine#'
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
  let bufname = bufname(buflist[winnr - 1])

  if len(bufname)
    return get(split(bufname, '/'), -1)
  else
    return '[No Name]'
  end
endfunction
