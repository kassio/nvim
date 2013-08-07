call filter(g:quickfixsigns_lists, 'v:key == "vcsdiff"')
let g:quickfixsigns_blacklist_buffer="^\\(NERD_tree_.*\\|ControlP\\)$"

function! FirstVCSDiffLine()
  let signs = QuickfixsignsListBufferSigns(bufnr('%'))
  call filter(signs, 'v:val.name =~ "QFS_VCS"')

  if empty(signs)
    return ""
  end

  let symbol_map = {
        \ 'QFS_VCS_ADD': '+',
        \ 'QFS_VCS_CHANGE': '=',
        \ 'QFS_VCS_DEL': '-',
        \ }

  let signs_count = len(signs)
  let first_sign = get(symbol_map, signs[0]['name'], '')

  return "[" . first_sign . " " . signs[0]['lnum'] . " #" . signs_count . "]"
endfunction
