if !exists("g:session_dir")
  let g:session_dir=expand('~/.vsessions')
endif

function! CreateDirSession()
  if !isdirectory(g:session_dir)
    call mkdir(expand(g:session_dir), "", 0700)
  endif
endfunction

function! SessionFileName()
  return g:session_dir . "/" . substitute(getcwd(), "\\/", "_", "g")
endfunction

function! SaveSession()
  :call CreateDirSession()
  execute "mksession! " . SessionFileName()
  redraw | echo 'Session Saved'
endfunction

function! LoadSession()
  if VerifySessionFile()
    execute "source " . SessionFileName()
    redraw | echo 'Session Loaded'
  else
    redraw | echo 'No Session Saved'
  endif
endfunction

function! DeleteSession() 
  setlocal modifiable
  if VerifySessionFile()
    if delete(SessionFileName()) == 0
      redraw | echo 'Session Deleted'
    endif
  else
    redraw | echo 'No Session Saved'
  endif
endfunction

function! VerifySessionFile()
  return isdirectory(g:session_dir) && filereadable(SessionFileName())
endfunction

nmap <silent> ,ss :call SaveSession()<CR>
nmap <silent> ,sl :call LoadSession()<CR>
nmap <silent> ,sd :call DeleteSession()<CR>
