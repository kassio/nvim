" Ruby Completion
let g:rubycomplete_rails = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_include_object = 1
let g:rubycomplete_include_objectspace = 1

command! NewRubyHashSyntax %s/\v:(\w+)\ ?\=\>/\1:/g

" Rails
map <C-p><C-r> :!rspec %<CR>
map <C-p>r :!rspec %<CR>
vmap <C-p>p :Rextract
