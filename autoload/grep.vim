function! grep#search(word, quote)
  let escaped_word = text#escape_all(a:word)
  let pattern = a:quote ? '"' . escaped_word . '"' : escaped_word
  let highlight = a:quote ? pattern : split(escaped_word, " ")[0]

  silent call text#highlight(highlight)
  silent exec 'grep! ' . pattern

  if !empty(getqflist())
    botright copen
  else
    echo a:word . " not found."
  end
endfunction
