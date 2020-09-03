let s:themes = ['dark', 'light']

function! theme#set(theme)
  let g:theme = s:validate(a:theme)

  exec printf('source %s', globpath(&runtimepath, 'plugin/theme.vim'))
endfunction

function! theme#current()
  return s:validate(get(g:, 'theme', ''), $ITERM_PROFILE)
endfunction

function! s:validate(theme, ...)
  if index(s:themes, a:theme) < 0
    return s:validate(get(a:, 1, ''), add(a:000[1:], 'dark'))
  else
    return a:theme
  end
endfunction
