command! -range NewRubyHashSyntax call Preserve(<line1>.','.<line2>.'s/\v:(\w+)\s*\=\>\s*/\1:\ /ge')
command! -range OldRubyHashSyntax call Preserve(<line1>.','.<line2>.'s/\v(\w+):\s*\ze[^:]/:\1\ =>\ /ge')

function! FormatRubyBlocks()
  " space after commas
  call Preserve('g/./Tabularize /,/l0r1')

  " space around operators
  let operators='('.
        \ '\*\*|'.
        \ '\*\=|'.
        \ '\*|'.
        \ '\=\=\=|'.
        \ '\>\>\=|'.
        \ '\<\<\=|'.
        \ '\&\&\=|'.
        \ '\|\|\=|'.
        \ '\=\=|'.
        \ '\<\=\>|'.
        \ '\<\=|'.
        \ '\>\=|'.
        \ '\!\=|'.
        \ '\=\~|'.
        \ '!\~|'.
        \ '\&\&|'.
        \ '\|\||'.
        \ '\-\=|'.
        \ '\+\=|'.
        \ '\<\<|'.
        \ '\-\>|'.
        \ '\=|'.
        \ '\+|'.
        \ '\-|'.
        \ '\&.'.
        \ ')'
  call Preserve('v/^\s*#/s/\v\s*'.operators.'\s*/\ \1\ /ge')

  " no space before ) ] ,
  call Preserve('%s/\v\s*([)\],])/\1/ge')

  " no space after ( [
  call Preserve('%s/\v([(\[])\s*/\1/ge')

  " space before }
  " except for #{} blocks
  call Preserve('%s/\v\s*\}/\ }/ge')

  " space after { ,
  " except for #{} blocks
  call Preserve('%s/\v([\{,])\s*/\1\ /ge')

  " no space before } or after {
  " for #{} blocks
  call Preserve('%s/\v#\{\s*([^ ][^}]+[^ ])\s*\}/#{\1}/ge')
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
