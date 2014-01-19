function! s:railsDev()
  let g:ruby_indent_access_modifier_style = 'indent'
  KeepTrailingSpaces
endfunction

command! RailsDev :call <SID>railsDev()
