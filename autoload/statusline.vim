function! statusline#default()
  let stl=""
        \ . <SID>highlight("\ %n\ ", "STLBufferNumber")
        \ . <SID>highlight("\ %t%m\ ", <SID>isFilenameModified())
        \ . <SID>highlight("%=", "STLSeparation")
        \ . " " . tmux_runner#statusline#tmux() . " "
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

function! s:highlight(value, color)
  return "\%#" . a:color . "#" . a:value . "%*"
endfunction
