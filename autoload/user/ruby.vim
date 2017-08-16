function! user#ruby#let_to_variable(line1, line2) abort
  let l:regexp = 's/\vlet\!?\s?\(:(.{-})\)\s\{\s(\_.{-})\s\}/@\1\ =\ \2/ge'
  call s:replace(a:line1, a:line2, l:regexp)
endfunction

function! user#ruby#variable_to_let(line1, line2) abort
  let l:regexp = 's/\v^\s*\zs\@?([^ ]+)\s*\=\s*(.+)$/let(:\1)\ {\ \2\ }/ge'
  call s:replace(a:line1, a:line2, l:regexp)
endfunction

function! user#ruby#new_ruby_hash_syntax(line1, line2) abort
  let l:regexp = 's/\v:(\w+)\s*\=\>\s*/\1:\ /ge'
  call s:replace(a:line1, a:line2, l:regexp)
endfunction

function! user#ruby#old_ruby_hash_syntax(line1, line2) abort
  let l:regexp = 's/\v(\w+):\s*\ze[^:]/:\1\ =>\ /ge'
  call s:replace(a:line1, a:line2, l:regexp)
endfunction

function! user#ruby#symbol_key_to_string(line1, line2) abort
  let l:regexp = 's/\v\[\zs:(.{-})\ze]/''\1''/g'
  call s:replace(a:line1, a:line2, l:regexp)
endfunction

function! user#ruby#string_key_to_symbol(line1, line2) abort
  let l:regexp = 's/\v\[\zs[''"](.{-})[''"]\ze]/:\1/g'
  call s:replace(a:line1, a:line2, l:regexp)
endfunction

function! user#ruby#symbol_hash_to_string(line1, line2) abort
  let l:regexp = 's/\(\w\+\):/''\1'' =>/g'
  call s:replace(a:line1, a:line2, l:regexp)
endfunction

function! user#ruby#string_hash_to_symbol(line1, line2) abort
  let l:regexp = 's/[''"]\(\w\+\)[''"]\ =>/\1:/g'
  call s:replace(a:line1, a:line2, l:regexp)
endfunction

function! user#ruby#symbol_array(line1, line2) abort
  let l:regexp = 's/\[\(\(:\w\+\),\(.\{-}\)\)]/\="%i[".substitute(submatch(1), "[,:]", "", "g")."]"/g'
  call s:replace(a:line1, a:line2, l:regexp)
endfunction

function! s:replace(line1, line2, regexp) abort
  let l:cmd = printf('silent %d,%d%s', a:line1, a:line2, a:regexp)
  call preserve#preserve(l:cmd)
endfunction

function! user#ruby#alternate_file(mod) abort
  if isdirectory('spec')
    let l:test = 'spec'
  elseif isdirectory('test')
    let l:test = 'test'
  else
    call util#echohl('ErrorMsg', 'No test directory found.')
  end

  exec printf('%s split %s', a:mod, s:alternative_file(l:test))
endfunction

function! s:alternative_file(test)
  let l:cfile = expand('%')
  let l:cfile_name = expand('%:t')

  if l:cfile =~# printf('^%s', a:test)
    let l:file = substitute(l:cfile, printf('^%s', a:test), 'app', '')
    let l:file_name = substitute(l:cfile_name, printf('_%s', a:test), '', '')
  else
    let l:file = substitute(l:cfile, '^app', a:test, '')
    let l:file_name = substitute(l:cfile_name, '.rb', printf('_%s.rb', a:test), '')
  end

  return substitute(l:file, l:cfile_name, l:file_name, '')
endfunction
