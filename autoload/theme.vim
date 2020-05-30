function! theme#set(theme)
  let l:themes = ['dark', 'light']
  if index(l:themes, a:theme) < 0
    echoe printf('Given theme is not valid, value must be %s', join(l:themes, ' or '))
  else
    let g:theme = a:theme
    exec printf(
          \ "source %s",
          \ globpath(&runtimepath, "plugin/theme.vim")
          \ )
  end
endfunction
