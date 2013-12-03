let g:boostmove=0
set updatetime=300

syn sync maxlines=60
syn sync minlines=50
set lazyredraw
set ttyfast
let g:tex_fast= ""

au CursorMoved * call BoostMoveON()
au CursorMovedI * call BoostMoveON()
au CursorHold * call BoostMoveOFF()
au CursorHoldI * call BoostMoveOFF()

function! BoostMoveON()
  if (winline() != line('$')) && (line('.') != 1)
    let g:boostmove=1
    setlocal norelativenumber
    if (winline() == winheight('.')) || (winline() == 1)
      setlocal nocursorline
    endif
  endif
endfunction

function! BoostMoveOFF()
  if g:boostmove==1
    let g:boostmove=0
    setlocal cursorline
    setlocal relativenumber
  endif
endfunction
