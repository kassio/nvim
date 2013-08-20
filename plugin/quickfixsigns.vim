call filter(g:quickfixsigns_lists, 'v:key == "vcsdiff"')
let g:quickfixsigns_blacklist_buffer="^\\(NERD_tree_.*\\|ControlP\\)$"

function! Quickfixsigns#GoToNextDiff()
  let signs = QuickfixsignsListBufferSigns(bufnr('%'))
  call filter(signs, 'v:val.name =~ "QFS_VCS"')

  let current_line = line('.')
  call filter(signs, 'v:val.lnum > '.current_line)

  if empty(signs)
    return
  end

  call cursor(signs[0].lnum, col('.'))
endfunction

map <leader>qn :call Quickfixsigns#GoToNextDiff()<CR>
