" Tabline
function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    let s .= '%' . (i + 1) . 'T'

    let s .= MyTabLabel(i + 1)
  endfor

  let s .= '%#TabLineFill#%T'

  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999XX'
  endif

  return s
endfunction

function! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let bufname = fnamemodify(bufname(buflist[0]), ":t")
  if(strlen(bufname) >= 15)
		let bufname = strpart(bufname, 0, 12) . "..."
	endif
  return ' ' . a:n . '· ' . bufname
endfunction

set tabline=%!MyTabLine()
