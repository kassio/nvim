let g:boost_moved=0
set updatetime=500

syn sync maxlines=60
syn sync minlines=50
set lazyredraw
set ttyfast
let g:tex_fast= ""

au CursorMoved * call <SID>BoostMoveON()
au CursorMovedI * call <SID>BoostMoveON()
au CursorHold * call <SID>BoostMoveOFF()
au CursorHoldI * call <SID>BoostMoveOFF()

function! s:BoostMoveON()
  if <SID>LineChanged()
    let g:boost_moved = 1
    call <SID>ToogleNumber()
  endif
endfunction

function! s:BoostMoveOFF()
  if g:boost_moved == 1
    let g:boost_moved = 0
    call <SID>ToogleNumber(1)
  endif
endfunction

function! s:ToogleNumber(...)
  if &l:relativenumber && &g:relativenumber
    let b:boost_relativenumber = 1
  endif
  if exists('b:boost_relativenumber')
    if a:0
      setlocal relativenumber
    else
      setlocal norelativenumber
    endif
  endif
endfunction!

function! s:LineChanged()
  let current_line = line('.')

  if exists('b:last_line') && b:last_line != current_line
    let b:last_line = current_line
    return 1
  end

  let b:last_line = current_line
  return 0
endfunction
