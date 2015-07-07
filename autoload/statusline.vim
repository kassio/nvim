function! statusline#neomake(scope)
  let loclist = filter(getloclist(0), "v:val.type == '".a:scope."'")

  if empty(loclist)
    return ""
  else
    let first_sign_line = loclist[0].lnum
    let sign_count = len(loclist)

    return printf("[%s: %s(%s)]", a:scope, first_sign_line, sign_count)
  end
endfunction
