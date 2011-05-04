if !exists("g:session_dir")
  let g:session_dir=expand('~/.vsessions')
endif

function! CreateDirSession()
  if !isdirectory(g:session_dir)
    call mkdir(expand(g:session_dir), "", 0700)
  endif
endfunction

function! SessionFileName()
  return g:session_dir . '/' . expand("%:p:h:t")
endfunction

function! SaveSession()
  :call CreateDirSession()
  execute "mksession! " . SessionFileName()
  redraw | echo 'Session Saved'
endfunction

function! LoadSession()
  if isdirectory(g:session_dir)
    normal mz<CR>
    execute "silent! source " . SessionFileName()
    normal `zzz<CR>
    redraw | echo 'Session Loaded'
  endif
endfunction

function! DeleteSession() 
  setlocal modifiable
  if isdirectory(g:session_dir)
    if delete(SessionFileName()) == 0
      redraw | echo 'Session Deleted'
    endif
  endif
endfunction

nmap <silent> ,ss :call SaveSession()<CR>
nmap <silent> ,sl :call LoadSession()<CR>
nmap <silent> ,sd :call DeleteSession()<CR>
