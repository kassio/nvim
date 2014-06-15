function! personal#nerdtree#mirror_toggle()
  if !nerdtree#isTreeOpen()
    call s:mirror_or_create()
  else
    NERDTreeToggle
  endif
endfunction

function! personal#nerdtree#mirror_find()
  call s:mirror_or_create()
  execute "wincmd p"

  silent NERDTreeFind
endfunction

function! s:mirror_or_create()
  silent NERDTreeMirror

  if exists('t:NERDTreeBufName')
    if nerdtree#isTreeOpen()
      silent NERDTreeFocus
    else
      silent NERDTreeToggle
    endif
  else
    silent NERDTree
  endif
endfunction
