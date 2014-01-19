function! FullRubyFormat(line1, line2)
  exec a:line1 . "," . a:line2 . " NewRubyHashSyntax"

  call FormatRuby(a:line1, a:line2)

  " indent all file
  call <SID>preserveIn(a:line1, a:line2, "normal v=")

  " remove trailing spaces
  call <SID>preserveIn(a:line1, a:line2, 's/\s\+$//e')

  " remove trailing lines
  call <SID>preserveIn(a:line1, a:line2, 's/\v($\n\s*)+%$//e')

  echo 'formatted'
endfunction

function! FormatRuby(line1, line2)
  " space after commas
  call <SID>preserveIn(a:line1, a:line2, 'g/./Tabularize /,/l0r1')

  " no space before ) ] ,
  call <SID>preserveIn(a:line1, a:line2, 's/\v\s*([)\],])/\1/ge')

  " no space after ( [
  call <SID>preserveIn(a:line1, a:line2, 's/\v([(\[])\s*/\1/ge')

  " space before }
  " except for #{} blocks
  call <SID>preserveIn(a:line1, a:line2, 's/\v[^{]\zs\s*\}/\ }/ge')

  " space after { ,
  " except for #{} blocks
  call <SID>preserveIn(a:line1, a:line2, 's/\v([\{,])\s*\ze[^}]+/\1\ /ge')

  " no space before } or after {
  " for #{} blocks
  call <SID>preserveIn(a:line1, a:line2, 's/\v#\{\s*([^ ][^}]+[^ ])\s*\}/#{\1}/ge')
endfunction

function! s:preserveIn(line1, line2, cmd)
  call Preserve(a:line1 . "," . a:line2 . a:cmd)
endfunction

command! -range=% FullRubyFormat call FullRubyFormat(<line1>, <line2>)

command! -range NewRubyHashSyntax call Preserve(<line1>.','.<line2>.'s/\v:(\w+)\s*\=\>\s*/\1:\ /ge')
command! -range OldRubyHashSyntax call Preserve(<line1>.','.<line2>.'s/\v(\w+):\s*\ze[^:]/:\1\ =>\ /ge')

nnoremap <leader>fr :FullRubyFormat<CR>
nnoremap <leader>fi :call Preserve('normal =ir')<CR>
vnoremap <leader>fi :FullRubyFormat<CR>
