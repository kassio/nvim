function! text#get_visual()
  try
    let temp = @s
    norm! gv"sy
    return substitute(escape(@s, '\*'), '\n', '\\n', 'g')
  finally
    let @s = temp
  endtry
endfunction

function! text#highlight(text)
  let @/=a:text
  call feedkeys(":let v:hlsearch=1\<CR>", "n")
endfunction

function! text#highlight_visual()
  call text#highlight(text#get_visual())
endfunction

function! text#escape_all(text)
  return substitute(escape(a:text, '#*^$.?/\|{[()]}'), '\n', '\\n', 'g')
endfunction
