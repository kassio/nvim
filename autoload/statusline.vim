function! statusline#neomake()
  let loclist = filter(getloclist(0), "v:val.type =~ 'W\\|E' ")

  if empty(loclist)
    return ""
  else
    let type = loclist[0].type
    let first_line = loclist[0].lnum
    let counter = len(loclist)

    return printf(" %s: %s(%s) ", type, first_line, counter)
  end
endfunction
