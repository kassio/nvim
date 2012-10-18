" Ruby Completion
let g:rubycomplete_rails = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_include_object = 1
let g:rubycomplete_include_objectspace = 1

autocmd FileType ruby,eruby
      \ let g:surround_35 = "#{\r}"             |
      \ let g:surround_45 = "<% \r %>"          |
      \ let g:surround_61 = "<%= \r %>"         |
      \ let g:surround_98 = "begin\n  \r\nend"  |
      \ let g:surround_100 = "do\n  \r\nend"    |
      \ let g:surround_119 = "%w[\r]"

command! NewRubyHashSyntax %s/\v:(\w+)\ ?\=\>/\1:/g
command! OldRubyHashSyntax %s/\v(\w+):\ ?/:\1 => /g

" Rails
map <C-p><C-r> :!rspec %<CR>
map <C-p>r :!rspec %<CR>
vmap <C-p>p :Rextract
