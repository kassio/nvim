function! personal#ruby#let_to_variable(line1, line2)
  let regexp = 's/\vlet\!?\s?\(:(.{-})\)\s\{\s(\_.{-})\s\}/@\1\ =\ \2/ge'
  let cmd = printf("silent %d,%d%s", a:line1, a:line2, regexp)
  call preserve#preserve(cmd)
endfunction

function! personal#ruby#variable_to_let(line1, line2)
  let regexp = 's/\v^\s*\zs\@?([^ ]+)\s*\=\s*(.+)$/let(:\1)\ {\ \2\ }/ge'
  let cmd = printf("silent %d,%d%s", a:line1, a:line2, regexp)
  call preserve#preserve(cmd)
endfunction

function! personal#ruby#new_ruby_hash_syntax(line1, line2)
  let regexp = 's/\v:(\w+)\s*\=\>\s*/\1:\ /ge'
  let cmd = printf("silent %d,%d%s", a:line1, a:line2, regexp)
  call preserve#preserve(cmd)
endfunction

function! personal#ruby#old_ruby_hash_syntax(line1, line2)
  let regexp = 's/\v(\w+):\s*\ze[^:]/:\1\ =>\ /ge'
  let cmd = printf("silent %d,%d%s", a:line1, a:line2, regexp)
  call preserve#preserve(cmd)
endfunction

function! personal#ruby#symbol_key_to_string(line1, line2)
  let regexp = 's/\v\[\zs:(.{-})\ze]/''\1''/g'
  let cmd = printf("silent %d,%d%s", a:line1, a:line2, regexp)
  call preserve#preserve(cmd)
endfunction

function! personal#ruby#string_key_to_symbol(line1, line2)
  let regexp = 's/\v\[\zs[''"](.{-})[''"]\ze]/:\1/g'
  let cmd = printf("silent %d,%d%s", a:line1, a:line2, regexp)
  call preserve#preserve(cmd)
endfunction
