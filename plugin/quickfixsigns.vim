call filter(g:quickfixsigns_lists, 'v:key == "vcsdiff"')
let g:quickfixsigns_blacklist_buffer="^\\(NERD_tree_.*\\|ControlP\\)$"

function! NextVCSLineChange()
  let signs = QuickfixsignsListBufferSigns(buffer_number('.'))
  if !empty(signs)
    return  "[VCS: " . signs[0]['lnum'] . "]"
  else
    return ""
  endif
endfunction
