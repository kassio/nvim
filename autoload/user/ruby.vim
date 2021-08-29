function! user#ruby#let_to_variable(line1, line2) abort
  let l:regexp = 's/\vlet\!?\s?\(:(.{-})\)\s\{\s(\_.{-})\s\}/\1\ =\ \2/ge'
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

function! user#ruby#stringfy_hash_keys(line1, line2) abort
  let l:regexp = 's/\(\w\+\):/''\1'' =>/g'
  call s:replace(a:line1, a:line2, l:regexp)
endfunction

function! user#ruby#symbolify_hash_keys(line1, line2) abort
  let l:regexp = 's/\([''"]\)\(\w\{-}\)\1\s*=>/\2: /g'
  call s:replace(a:line1, a:line2, l:regexp)
endfunction

function! user#ruby#decolunize(line1, line2)
  let l:regexp = 's/[^ ]\zs\s\{2,}\ze[^ ]/ /'
  call s:replace(a:line1, a:line2, l:regexp)
endfunction

function! s:replace(line1, line2, regexp) abort
  let l:cmd = printf('silent %d,%d%s', a:line1, a:line2, a:regexp)
  call preserve#preserve(l:cmd)
endfunction

function! user#ruby#namespace(...)
  let Fn = get(a:, 1, function('s:echo'))
  let Callback = { _, data -> Fn(data[0]) }

  let cmd = ['/Users/kassioborges/.asdf/shims/ruby',
        \ globpath(&runtimepath, 'ftplugin/ruby/namespace.rb'),
        \ printf('%s:%s', expand('%:p'), line('.'))]

  call jobstart(cmd, {
        \   'on_stdout': Callback,
        \   'stdout_buffered': 1
        \ })
endfunction

function! user#ruby#copy_namespace()
  call user#ruby#namespace(function('s:copy'))
endfunction

function! s:copy(data)
  echo printf('"%s" copied', a:data)
  let @*=a:data
endfunction

function! s:echo(value)
  echo a:value
endfunction

function! user#ruby#rspec()
  let g:test#last_position = {
        \ 'file': 'spec/models/file_spec.rb',
        \ 'col': 1,
        \ 'line': 1
        \ }
  TestSuite
endfunction
