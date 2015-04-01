function! text#get_visual()
  try
    let temp = @s
    norm! gv"sy
    return substitute(escape(@s, '\*'), '\n', '\\n', 'g')
  finally
    let @s = temp
  endtry
endfunction

function! text#get_visual_lines()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]

  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][:col2 - 2]
  let lines[0] = lines[0][col1 - 1:]

  return lines
endfunction

function! text#highlight(text)
  let @/=a:text
  call feedkeys(":let v:hlsearch=1\<CR>", "n")
  call feedkeys(":call preserve#preserve('%s//&/gn')\<CR>", "n")
endfunction

function! text#highlight_visual()
  call text#highlight(text#get_visual())
endfunction

function! text#escape_all(text)
  return substitute(escape(a:text, '#*^$.?/\|{[()]}'), '\n', '\\n', 'g')
endfunction
