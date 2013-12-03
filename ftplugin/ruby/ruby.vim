" Ruby Completion
let g:rubycomplete_rails = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_include_object = 1
let g:rubycomplete_include_objectspace = 1

" Surround stuff
let g:surround_35  = "#{\r}"             " #
let g:surround_45  = "<% \r %>"          " -
let g:surround_61  = "<%= \r %>"         " =
let g:surround_98  = "begin\n\t\r\nend"  " b
let g:surround_99  = "class\n\t\r\nend"  " c
let g:surround_100 = "do\n\t\r\nend"     " d
let g:surround_109 = "module\n\t\r\nend" " m
let g:surround_119 = "%w[\r]"            " w

command! MinitestAutoComplete set completefunc=syntaxcomplete#Complete
command! LetToVariable call Preserve('s/\vlet\!?\s?\(:(.{-})\)\s\{\s(\_.{-})\s\}/@\1\ =\ \2/ge')
command! VariableToLet call Preserve('s/\v^\s*\zs\@?([^ ]+)\s*\=\s*(.+)$/let(:\1)\ {\ \2\ }/ge')

let g:ruby_path=system('echo "$RBENV_ROOT/versions/$(rbenv version-name)/bin/ruby"')
set re=1
