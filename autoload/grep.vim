function! grep#search(word, quote)
  let escaped_word = text#escape_all(a:word)
  let pattern = a:quote ? '"' . escaped_word . '"' : escaped_word
  let highlight = matchstr(escaped_word, '\v^(["''''])?\zs.+\ze\1.*$')

  silent exec 'grep! ' . pattern

  if !empty(getqflist())
    botright copen
    silent call text#highlight(highlight)
  else
    echo a:word . " not found."
  end
endfunction
