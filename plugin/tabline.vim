function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    let i += 1
    if i == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    let s .= '%' . i . 'T'

    let s .= ' [' . i . ']%{MyTabLabel(' . i . ')} '
  endfor

  let s .= '%#TabLineFill#%T'
  return s
endfunction

function! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return fnamemodify(bufname(buflist[winnr - 1]), ":t")
endfunction

set tabline=%!MyTabLine()
