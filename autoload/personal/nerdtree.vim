function! personal#nerdtree#mirror_toggle()
  if nerdtree#isTreeOpen()
    NERDTreeToggle
  else
    call s:mirror_or_create()
  endif
endfunction

function! personal#nerdtree#mirror_find()
  call s:mirror_or_create()
  execute "wincmd p"

  NERDTreeFind
endfunction

function! s:mirror_or_create()
  silent NERDTreeMirror

  if g:NERDTree.ExistsForTab()
    if nerdtree#isTreeOpen()
      silent NERDTreeFocus
    else
      silent NERDTreeToggle
    endif
  else
    silent NERDTree
  endif
endfunction
