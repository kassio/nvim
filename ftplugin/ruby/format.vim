command! -range NewRubyHashSyntax call Preserve(<line1>.','.<line2>.'s/\v:(\w+)\s*\=\>/\1:\ /ge')
command! -range OldRubyHashSyntax call Preserve(<line1>.','.<line2>.'s/\v(\w+):\s*\ze[^:]/:\1\ =>\ /ge')

function! FormatRubyBlocks()
  " no space before ) ] ,
  call Preserve('%s/\v\s*([)\],])/\1/g')

  " no space after ( [
  call Preserve('%s/\v([(\[])\s*/\1/g')

  " space before }
  " except for #{} blocks
  call Preserve('%s/\v\s*\}/\ }/g')

  " space after { ,
  " except for #{} blocks
  call Preserve('%s/\v([\{,])\s*/\1\ /g')

  " no space before } or after {
  " for #{} blocks
  call Preserve('%s/\v#\{\s*([^ ][^}]+[^ ])\s*\}/#{\1}/g')
endfunction

function! FullRubyFormat()
  %NewRubyHashSyntax
  call FormatRubyBlocks()

  " indent all file
  call Preserve('normal gg=G')

  " remove trailing spaces
  call Preserve('%s/\s\+$//e')
  " remove trailing lines
  call Preserve('%s/\v($\n\s*)+%$//e')

  echo 'formatted'
endfunction

nnoremap <leader>fr :call FullRubyFormat()<CR>
nnoremap <leader>fi :call Preserve('normal =ir')<CR>
