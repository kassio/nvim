function! visual_text#get()
  try
    let temp = @s
    norm! gv"sy
    return substitute(escape(@s, '\'), '\n', '\\n', 'g')
  finally
    let @s = temp
  endtry
endfunction
