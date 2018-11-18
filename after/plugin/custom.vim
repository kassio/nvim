function! s:load_custom_config()
  let l:cwd = getcwd()
  let l:folders = split(l:cwd, '/')
  let l:len = len(l:folders) - 1

  while l:len >= 0
    let l:path = l:folders[0:l:len] + ['.custom.vim']
    let l:path = '/' . join(l:path, '/')
    let l:len -= 1

    if filereadable(l:path)
      exec 'source ' . l:path
    end
  endwhile
endfunction

call s:load_custom_config()
