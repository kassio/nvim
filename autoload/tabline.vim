function! tabline#update()
  let tabline = ''

  for i in range(tabpagenr('$'))
    let tabnr = i + 1
    if tabpagenr() == tabnr
      let tabline .=
            \   '%#StatusLine#'
            \ . '%'.tabnr.'T'
            \ . '%#SLSection2#'
            \ . tabline#label(tabnr)
            \ . '%#StatusLine#'
    else
      let tabline .=
            \   '%#StatusLineNC#'
            \ . '%'.tabnr.'T'
            \ . tabline#label(tabnr)
            \ . '%#StatusLineNC#'
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
