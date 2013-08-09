
" Ruby Completion
let g:rubycomplete_rails = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_include_object = 1
let g:rubycomplete_include_objectspace = 1

augroup ruby_setup
  autocmd!
  autocmd FileType ruby,eruby set iskeyword+=?,!,@
  autocmd FileType ruby,eruby,rails let g:surround_35  = "#{\r}"             " #
  autocmd FileType ruby,eruby,rails let g:surround_45  = "<% \r %>"          " -
  autocmd FileType ruby,eruby,rails let g:surround_61  = "<%= \r %>"         " =
  autocmd FileType ruby,eruby,rails let g:surround_98  = "begin\n\t\r\nend"  " b
  autocmd FileType ruby,eruby,rails let g:surround_99  = "class\n\t\r\nend"  " c
  autocmd FileType ruby,eruby,rails let g:surround_100 = "do\n\t\r\nend"     " d
  autocmd FileType ruby,eruby,rails let g:surround_109 = "module\n\t\r\nend" " m
  autocmd FileType ruby,eruby,rails let g:surround_119 = "%w[\r]"            " w
augroup END

command! NewRubyHashSyntax :call Preserve('%s/\v:(\w+)\s*\=\>/\1:/ge')
command! OldRubyHashSyntax :call Preserve('%s/\v(\w+):\s*\ze[^:]/:\1\ =>\ /ge')

function! FormatRubyBlocks()
  let @p=''
  let @p='f{ cs{}cs }{%@p'
  call Preserve('g/[^#]{[^}]\+}/normal @p')

  let @o=''
  let @o='f(cs()%@o'
  call Preserve('g/([^)]\+)/normal @o')

  let @i=''
  let @i='f[cs[]%@i'
  call Preserve('g/\[[^]]\+\]/normal @i')
endfunction

function! FullRubyFormat()
  silent IndentAllFile
  silent NewRubyHashSyntax
  silent :call FormatRubyBlocks()
  echo 'formatted'
endfunction

nnoremap ,fr :call FullRubyFormat()<CR>
