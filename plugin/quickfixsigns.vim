call filter(g:quickfixsigns_lists, 'v:key == "vcsdiff"')
let g:quickfixsigns_blacklist_buffer="^\\(NERD_tree_.*\\|ControlP\\)$"

function! FirstVCSDiffLine()
  let signs = QuickfixsignsListBufferSigns(bufnr('%'))

  return GetVCSDiffSymbol(signs, 0)
endfunction


function! GetVCSDiffSymbol(signs, id)
  if empty(a:signs)
    return ""
  endif

  let symbol_map = {
        \ 'QFS_VCS_ADD': '+',
        \ 'QFS_VCS_CHANGE': '=',
        \ 'QFS_VCS_DEL': '-',
        \ }

  let symbol = get(symbol_map, a:signs[a:id]['name'], '')

  if symbol != ''
    return  "[" . symbol . " " . a:signs[a:id]['lnum'] . "]"
  else
    return GetVCSDiffSymbol(a:signs, a:id + 1)
  endif
endfunction
