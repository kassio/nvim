function! my_nerdtree#mirror_find()
  if !nerdtree#isTreeOpen()
    let l:previous_winnr = winnr()
    call my_nerdtree#mirror_or_create()
    execute l:previous_winnr . "wincmd w"
  endif

  silent NERDTreeFind
endfunction

function! my_nerdtree#mirror_or_create()
  if exists('t:NERDTreeBufName') && t:NERDTreeBufName != 'NERD_tree_1'
    let t:NERDTreeBufName = 'NERD_tree_1'
  endif

  let l:previous_winnr = winnr("$")
  if !nerdtree#isTreeOpen()
    silent NERDTreeMirror
  endif

  if l:previous_winnr == winnr("$")
    silent NERDTreeToggle
  endif
endfunction
