function! ruby_helpers#let_to_variable(line1, line2)
  let regexp = 's/\vlet\!?\s?\(:(.{-})\)\s\{\s(\_.{-})\s\}/@\1\ =\ \2/ge'
  let cmd = printf("%d,%d%s", a:line1, a:line2, regexp)
  call preserve#preserve(cmd)
endfunction

function! ruby_helpers#variable_to_let(line1, line2)
  let regexp = 's/\v^\s*\zs\@?([^ ]+)\s*\=\s*(.+)$/let(:\1)\ {\ \2\ }/ge'
  let cmd = printf("%d,%d%s", a:line1, a:line2, regexp)
  call preserve#preserve(cmd)
endfunction

function! ruby_helpers#new_ruby_hash_syntax(line1, line2)
  let regexp = 's/\v:(\w+)\s*\=\>\s*/\1:\ /ge'
  let cmd = printf("%d,%d%s", a:line1, a:line2, regexp)
  call preserve#preserve(cmd)
endfunction

function! ruby_helpers#old_ruby_hash_syntax(line1, line2)
  let regexp = 's/\v(\w+):\s*\ze[^:]/:\1\ =>\ /ge'
  let cmd = printf("%d,%d%s", a:line1, a:line2, regexp)
  call preserve#preserve(cmd)
endfunction
