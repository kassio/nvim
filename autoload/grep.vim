function! grep#search(word)
  let escaped_word = text#escape_all(a:word)
  let highlight = matchstr(escaped_word, '\v^(["''''])?\zs.+\ze\1.*$')

  call s:grep(escaped_word, highlight)
endfunction

function! grep#autosearch(word)
  let escaped_word = text#escape_all(a:word)
  let highlight = matchstr(escaped_word, '\v^(["''''])?\zs.+\ze\1.*$')

  call s:grep('"' . escaped_word . '"', highlight)
endfunction

function! s:grep(text, highlight)
  silent exec 'grep! "' . a:text . '"'

  if !empty(getqflist())
    botright copen
    silent call text#highlight(a:highlight)
  else
    echo a:word . " not found."
  end
endfunction
