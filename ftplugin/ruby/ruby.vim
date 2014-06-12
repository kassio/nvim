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

command! -range LetToVariable call ruby_helpers#let_to_variable(<line1>, <line2>)
command! -range VariableToLet call ruby_helpers#variable_to_let(<line1>, <line2>)

command! -range NewRubyHashSyntax call ruby_helpers#new_ruby_hash_syntax(<line1>, <line2>)
command! -range OldRubyHashSyntax call ruby_helpers#old_ruby_hash_syntax(<line1>, <line2>)

set iskeyword+=\?,\!
