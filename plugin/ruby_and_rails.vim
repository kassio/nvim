" Ruby Completion
let g:rubycomplete_rails = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_include_object = 1
let g:rubycomplete_include_objectspace = 1

autocmd FileType ruby,eruby,rails let g:surround_35  = "#{\r}"             " #
autocmd FileType ruby,eruby,rails let g:surround_45  = "<% \r %>"          " -
autocmd FileType ruby,eruby,rails let g:surround_61  = "<%= \r %>"         " =
autocmd FileType ruby,eruby,rails let g:surround_98  = "begin\n\t\r\nend"  " b
autocmd FileType ruby,eruby,rails let g:surround_99  = "class\n\t\r\nend"  " c
autocmd FileType ruby,eruby,rails let g:surround_100 = "do\n\t\r\nend"     " d
autocmd FileType ruby,eruby,rails let g:surround_109 = "module\n\t\r\nend" " m
autocmd FileType ruby,eruby,rails let g:surround_119 = "%w[\r]"            " w

command! NewRubyHashSyntax %s/\v:(\w+)\ ?\=\>/\1:/g
command! OldRubyHashSyntax %s/\v(\w+):\ ?\ze[^:]/:\1 => /g

let g:RubyRunner_key = '<leader>ef'
let g:RubyRunner_keep_focus_key = '<leader>ee'

command! FR set ft=ruby
