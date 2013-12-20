command! NewRubyHashSyntax call Preserve('%s/\v:(\w+)\s*\=\>/\1:/ge')
command! OldRubyHashSyntax call Preserve('%s/\v(\w+):\s*\ze[^:]/:\1\ =>\ /ge')

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
  silent call FormatRubyBlocks()
  echo 'formatted'
endfunction

nnoremap <leader>fr :call FullRubyFormat()<CR>
nnoremap <leader>fi :call Preserve('normal =ir')<CR>
