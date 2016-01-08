function! tabline#update()
  let tabline = ''

  for i in range(tabpagenr('$'))
    let tabnr = i + 1
    if tabpagenr() == tabnr
      let tabline .=
            \   '%#StatusLine#'
            \ . '%'.tabnr.'T'
            \ . '%#SLSection2#'
            \ . ' '.tabnr
            \ . tabline#fname(tabnr)
            \ . '%#StatusLine#'
    else
      let tabline .=
            \   '%#StatusLineNC#'
            \ . '%'.tabnr.'T'
            \ . ' '.tabnr
            \ . tabline#fname(tabnr)
            \ . '%#StatusLineNC#'
    end
  endfor

  return tabline
endfunction

function! tabline#fname(tabnr)
  let buflist = tabpagebuflist(a:tabnr)
  let winnr = tabpagewinnr(a:tabnr)
  let fname = bufname(buflist[winnr - 1])

  return printf(' %s ', len(fname) ? s:format_fname(fname) : '[No Name]')
endfunction

function! s:format_fname(fname)
  return get(split(a:fname, '/'), -1)
endfunction
