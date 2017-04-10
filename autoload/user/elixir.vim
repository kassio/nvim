function! user#elixir#module_name()
  let module_name = user#snips#filename_camelized('MyModule')

  echom expand('%:p')
  if expand('%:p') =~ "/web/"
    return user#snips#dirname_camelized() . '.' . module_name
  else
    return module_name
  end
endfunction
