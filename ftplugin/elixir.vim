setl noautoindent

" Indent all file
nnoremap <buffer><silent> <leader>ff :call preserve#preserve('silent normal gg=G \\| ALEFix')<cr>

nnoremap <buffer><silent> <leader>tf :<c-u>call test#elixir#run('File')<cr>
nnoremap <buffer><silent> <leader>tc :<c-u>call test#elixir#run('Nearest')<cr>

call textobj#user#plugin('rubyblock', {
      \   'eex': {
      \     'pattern': ['<%=\?\s\?', '\s\?%>'],
      \     'select-a': 'a=',
      \     'select-i': 'i='
      \   }
      \ })

function! s:to_sigil(line1, line2) abort
  let l:regexp = 's/\[\(\(:\w\+\),\(.\{-}\)\)]/\="~w[".substitute(submatch(1), "[,:]", "", "g")."]a"/g'
  call s:replace(a:line1, a:line2, l:regexp)
endfunction

function! s:replace(line1, line2, regexp) abort
  let l:cmd = printf('silent %d,%d%s', a:line1, a:line2, a:regexp)
  call preserve#preserve(l:cmd)
endfunction

command! -range ToSigil
      \ call s:to_sigil(<line1>, <line2>)
