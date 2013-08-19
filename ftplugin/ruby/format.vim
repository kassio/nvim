let g:surround_35  = "#{\r}"             " #
let g:surround_45  = "<% \r %>"          " -
let g:surround_61  = "<%= \r %>"         " =
let g:surround_98  = "begin\n\t\r\nend"  " b
let g:surround_99  = "class\n\t\r\nend"  " c
let g:surround_100 = "do\n\t\r\nend"     " d
let g:surround_109 = "module\n\t\r\nend" " m
let g:surround_119 = "%w[\r]"            " w

command! NewRubyHashSyntax :call Preserve('%s/\v:(\w+)\s*\=\>/\1:/ge')
command! OldRubyHashSyntax :call Preserve('%s/\v(\w+):\s*\ze[^:]/:\1\ =>\ /ge')

function! FormatRubyBlocks()
  " space between {}
  let @p=''
  let @p='f{ cs{}cs }{%@p'
  call Preserve('g/[^#]{[^}]\+}/normal @p')

  " no space between ()
  let @o=''
  let @o='f(cs()%@o'
  call Preserve('g/([^)]\+)/normal @o')

  " no space between []
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
