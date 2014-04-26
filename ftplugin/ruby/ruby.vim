let g:ruby_path=system('echo "$RBENV_ROOT/versions/$(rbenv version-name)/bin/ruby"')

" Ruby Completion
let g:rubycomplete_rails = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_include_object = 1
let g:rubycomplete_include_objectspace = 1

" Surround stuff
let g:surround_{char2nr("#")} = "#{\r}"
let g:surround_{char2nr("-")} = "<% \r %>"
let g:surround_{char2nr("=")} = "<%= \r %>"
let g:surround_{char2nr("b")} = "begin\n\t\r\nend"
let g:surround_{char2nr("c")} = "class\n\t\r\nend"
let g:surround_{char2nr("d")} = "do\n\t\r\nend"
let g:surround_{char2nr("m")} = "module\n\t\r\nend"
let g:surround_{char2nr("w")} = "%w[\r]"

command! MinitestAutoComplete set completefunc=syntaxcomplete#Complete

function! s:letToVariable(line1, line2)
  let regexp = 's/\vlet\!?\s?\(:(.{-})\)\s\{\s(\_.{-})\s\}/@\1\ =\ \2/ge'
  let cmd = printf("%d,%d%s", a:line1, a:line2, regexp)
  call Preserve(cmd)
endfunction
command! -range LetToVariable call <SID>letToVariable(<line1>, <line2>)

function! s:variableToLet(line1, line2)
  let regexp = 's/\v^\s*\zs\@?([^ ]+)\s*\=\s*(.+)$/let(:\1)\ {\ \2\ }/ge'
  let cmd = printf("%d,%d%s", a:line1, a:line2, regexp)
  call Preserve(cmd)
endfunction
command! -range VariableToLet call <SID>variableToLet(<line1>, <line2>)

command! -range NewRubyHashSyntax
      \ call Preserve(<line1>.','.<line2>.'s/\v:(\w+)\s*\=\>\s*/\1:\ /ge')
command! -range OldRubyHashSyntax
      \ call Preserve(<line1>.','.<line2>.'s/\v(\w+):\s*\ze[^:]/:\1\ =>\ /ge')

set iskeyword+=\?,\!
