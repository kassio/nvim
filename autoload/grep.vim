function! grep#search(word, quote)
  let escaped_word = text#escape_all(a:word)
  let pattern = a:quote ? '"' . escaped_word . '"' : escaped_word

  silent call text#highlight(a:word)
  silent exec 'grep! ' . pattern

  if !empty(getqflist())
    botright copen
  else
    echo a:word . " not found."
  end
endfunction
