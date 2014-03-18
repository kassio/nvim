function! text#get_visual()
  try
    let temp = @s
    norm! gv"sy
    return substitute(escape(@s, '\'), '\n', '\\n', 'g')
  finally
    let @s = temp
  endtry
endfunction

function! text#highlight(text)
  echom a:text
  let @/=a:text
  call feedkeys(":let &hlsearch=1\<CR>", "n")
endfunction
