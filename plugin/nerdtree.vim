if exists('b:nerdree_setup_loaded')
  finish
endif
let b:nerdree_setup_loaded=1

let NERDTreeWinPos = "right"
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeHighlightCursorline = 1

function! NERDTreeMirrorFind()
  if !nerdtree#isTreeOpen()
    let l:previous_winnr = winnr()
    call NERDTreeMirrorOrCreate()
    execute l:previous_winnr . "wincmd w"
  endif

  silent NERDTreeFind
endfunction

function! NERDTreeMirrorOrCreate()
  let l:previous_winnr = winnr("$")
  silent NERDTreeMirror

  if l:previous_winnr == winnr("$")
    silent NERDTreeToggle
  endif
endfunction

nmap <silent> <leader>p :call NERDTreeMirrorOrCreate()<CR>
nnoremap <silent> <leader>fl :call NERDTreeMirrorFind()<CR>

aug nerdtree_view
  au!
  au BufLeave *NERD_tree* let s:NERDTreeView=winsaveview()
  au BufEnter *NERD_tree*
        \ if exists('b:NERDTreeView') |
        \   call winrestview(b:NERDTreeView) |
        \   unlet b:NERDTreeView |
        \ endif
aug END
