function! SelectHl()
  aug SelectHl
    au CursorMoved * call SelectHlManagedClean()
  aug END
  call SelectHlClean()
  call SelectHlHighlight()

  let b:select_hl_manager = timer_start(1000, 'SelectHlManager', {'repeat': -1})
endfunction
command! SelectHl call SelectHl()

function! SelectHlStop()
  if get(b:, 'select_hl_manager', 0)
    call timer_stop(b:select_hl_manager)
  end
  if get(b:, 'select_hl_timer', 0)
    call timer_stop(b:select_hl_timer)
  end

  au! SelectHl
  call SelectHlClean(1)
endfunction
command! SelectHlStop call SelectHlStop()

function! SelectHlManager(...)
  if !get(b:, 'select_hl_timer', 0) || empty(timer_info(b:select_hl_timer))
    call SelectHlHighlight()
    let b:select_hl_timer = timer_start(500, 'SelectHlDo', {'repeat': -1})
  else
    call timer_pause(b:select_hl_timer, 0)
  end
endfunction

function! SelectHlDo(...)
  if get(b:, 'select_hl_timer', 0)
    call SelectHlHighlight()
  end
endfunction

function! SelectHlHighlight()
  call matchadd('SelectHl', s:currentWord(), -1)
endfunction

function! SelectHlManagedClean()
  if get(b:, 'select_hl_manager', 0)
    if get(b:, 'select_hl_timer', 0)
      call timer_pause(b:select_hl_timer, 1)
    end
    call SelectHlClean()
  end
endfunction

function! SelectHlClean(...)
  let force = a:0 ? a:1 : 0
  for l:m in filter(getmatches(), { _, m -> m.group ==# 'SelectHl' && (force || m.pattern !=# s:currentWord()) })
    call matchdelete(l:m.id)
  endfor
endfunction

function! s:currentWord()
  return escape(expand('<cword>'), '.~')
endfunction
