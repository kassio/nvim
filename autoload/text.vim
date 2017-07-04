function! text#get_visual()
  let [l:lnum1, l:col1] = getpos("'<")[1:2]
  let [l:lnum2, l:col2] = getpos("'>")[1:2]

  let l:lines = getline(l:lnum1, l:lnum2)
  let l:lines[-1] = l:lines[-1][:l:col2 - 1]
  let l:lines[0] = l:lines[0][l:col1 - 1:]

  return join(l:lines, '\n')
endfunction

function! text#highlight_visual()
  call text#highlight(text#get_visual())
endfunction

function! text#highlight(text)
  let @/ = escape(a:text, ' *^$./\[]')
  call feedkeys(":let v:hlsearch=1\<cr>", 'n')
  call feedkeys(":call preserve#preserve('%s///gne')\<cr>", 'n')
endfunction

function! text#highlight_sensitive_visual()
  call text#highlight_sensitive(text#get_visual())
endfunction

function! text#highlight_sensitive(text)
  let @/ = '\C' . escape(a:text, ' *^$./\[]')
  call feedkeys(":let v:hlsearch=1\<cr>", 'n')
endfunction

function! text#escape_all(text)
  return substitute(escape(a:text, '#*^$.?/\|{[()]}'), '\n', '\\n', 'g')
endfunction

function! text#remove_comments()
  let l:comments = printf('^\s*%s', s:comment_dict().begin)
  execute printf('global/%s/d', l:comments)
  execute 'global/^\_s$/d'
endfunction

function! s:comment_dict()
  if !exists('b:comment_dict')
    let l:comments = split(&commentstring, '%s')
    let b:comment_dict = {
          \ 'begin': get(l:comments, 0, ''),
          \ 'end': get(l:comments, 1, '')
          \ }
  end

  return b:comment_dict
endfunction
