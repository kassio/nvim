function! SelectHl()
  call SelectHlClean()
  call SelectHlHighlight()

  if !get(b:, 'select_hl_enabled', 0)
    let b:select_hl_enabled = 1
    call timer_start(3000, 'SelectHlManager', {'repeat': -1})
  end
endfunction

function! SelectHlManager(...)
  if !get(b:, 'select_hl_timer', 0)
    call SelectHlHighlight()
    let b:select_hl_timer = timer_start(1500, 'SelectHlDo', {'repeat': -1})
  else
    if get(b:, 'select_hl_timer', 0)
      call timer_pause(b:select_hl_timer, 0)
    end
  end
endfunction

function! SelectHlDo(...)
  if get(b:, 'select_hl_timer', 0) && get(b:, 'select_hl_enabled', 0)
    call SelectHlHighlight()
  end
endfunction

function! SelectHlHighlight()
  call matchadd('SelectHl', s:currentWord(), -1)
endfunction

function! SelectHlClean()
  if get(b:, 'select_hl_timer', 0)
    call timer_pause(b:select_hl_timer, 1)
  end

  for l:m in getmatches()
    if l:m.group ==# 'SelectHl' && l:m.pattern !=# s:currentWord()
      call matchdelete(l:m.id)
    end
  endfor
endfunction

function! s:currentWord()
  return escape(expand('<cword>'), '.~')
endfunction

aug SelectHl
  au!
  au CursorMoved * call SelectHlClean()
  au BufEnter,WinEnter * call SelectHl()
aug END
