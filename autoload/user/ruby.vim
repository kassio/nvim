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
  let l:regexp = 's/[''"]\(\w\+\)[''"]\ =>/\1:/g'
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

function! user#ruby#alternate_file(mod) abort
  if isdirectory('spec')
    let l:test = 'spec'
  elseif isdirectory('test')
    let l:test = 'test'
  else
    call util#echohl('ErrorMsg', 'No test directory found.')
    return
  end

  exec printf('%s new %s', a:mod, s:alternative_file(l:test))
endfunction

function! user#ruby#rspec()
  let g:test#last_position = {
        \ 'file': 'spec/models/file_spec.rb',
        \ 'col': 1,
        \ 'line': 1
        \ }
  TestSuite
endfunction

function! s:alternative_file(lib)
  let file = expand('%:t')

  if file =~# printf('.*%s.*', a:lib)
    return s:code_path(a:lib)
  else
    return s:test_path(a:lib)
  end
endfunction

function! s:code_path(lib)
  let path = split(expand('%'), '/')
  let file = substitute(expand('%:t'), printf('_%s.rb', a:lib), '.rb', '')

  let result = path[index(path, a:lib) + 1: -2]
  let result = insert(result, 'app')
  let result = add(result, file)

  return join(result, '/')
endfunction

function! s:test_path(lib)
  let path = split(expand('%'), '/')
  let file = substitute(expand('%:t'), '.rb', printf('_%s.rb', a:lib), '')

  let result = path[index(path, 'app') + 1: -2]
  let result = insert(result, a:lib)
  let result = add(result, file)

  return join(result, '/')
endfunction

function! user#ruby#namespace()
  return system(join(s:namespace_cmd(), ' '))
endfunction

function! user#ruby#set_namespace()
  if !get(b:, 'ruby_fetching_namespace_lock', v:false)
    let b:ruby_fetching_namespace_lock = v:true
    call jobstart(s:namespace_cmd(), {
          \ 'on_stdout': { _, data -> s:set_buffer_namespace(trim(data[0])) }
          \ })
  end
endfunction

function! s:set_buffer_namespace(namespace)
  if a:namespace !=# ''
    let b:namespace = a:namespace
  end

  sleep 500m
  let b:ruby_fetching_namespace_lock = v:false
endfunction

function! s:namespace_cmd()
  return
        \ [
        \  '/Users/kassioborges/.asdf/shims/ruby',
        \  globpath(&runtimepath, 'ftplugin/ruby/namespace.rb'),
        \  printf('%s:%s', expand('%:p'), line('.'))
        \ ]
endfunction

require('ruby')
