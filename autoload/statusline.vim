function! statusline#default()
  let stl=""
        \ . <SID>highlight("\ %n\ ", "STLBufferNumber")
        \ . <SID>highlight("\ %t%m\ ", <SID>isFilenameModified())
        \ . <SID>highlight(git#check_user(), "STLErrorAlert")
        \ . <SID>highlight("%=", "STLSeparation")
        \ . <SID>tmux()
        \ . SyntasticStatuslineFlag()
        \ . <SID>highlight("\ %r%y[%{&ff}][%{&fenc!=''?&fenc:&enc}][%c,%l/%L]", "STLStats")
  return stl
endfunction

function! s:isFilenameModified()
  if &modified
    return "STLWarningAlert"
  else
    return "STLFileName"
  endif
endfunction

function! s:tmux()
  let l:result = tmux_runner#statusline#tmux()
  if l:result == ''
    return ''
  endif

  let l:color = l:result =~? 'failed' ? 'STLErrorAlert' : 'STLSuccessAlert'

  return <SID>highlight(' ' . l:result . ' ', l:color)
endfunction

function! s:highlight(value, color)
  return "\%#" . a:color . "#" . a:value . "%*"
endfunction
