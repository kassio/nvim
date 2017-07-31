function! user#surround#erb() abort
  let g:surround_{char2nr("-")} = "<% \r %>"
  let g:surround_{char2nr("=")} = "<%= \r %>"
endfunction

function! user#surround#ruby_string_interpolation() abort
  let g:surround_{char2nr("#")} = "#{\r}"
endfunction

function! user#surround#javascript_string_interpolation() abort
  let g:surround_{char2nr("$")} = "${\r}"
endfunction
