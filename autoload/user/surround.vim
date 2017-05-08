function! user#surround#erb()
  let g:surround_{char2nr("-")} = "<% \r %>"
  let g:surround_{char2nr("=")} = "<%= \r %>"
endfunction

function! user#surround#ruby_string_interpolation()
  let g:surround_{char2nr("#")} = "#{\r}"
endfunction

function! user#surround#javascript_string_interpolation()
  let g:surround_{char2nr("$")} = "${\r}"
endfunction
