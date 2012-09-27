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
    let s .= '%=%#TabLine#%999X✗'
  endif

  return s
endfunction

function! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)

	let bufname = fnamemodify(bufname(buflist[0]), ":~:.")
	let bufname = substitute(bufname, '\([^/]\)[^/]*\/', '\1/', 'g')

	let bufname_splited = split(bufname, '/')
	let bufname_length = len(bufname_splited)

	if(bufname_length > 5)
		let max = bufname_length - 5
		call remove(bufname_splited, 0, max)
		let bufname = join(bufname_splited, '/')
	endif

	return ' ' . a:n . '·' . bufname . ' '
endfunction

set tabline=%!MyTabLine()
