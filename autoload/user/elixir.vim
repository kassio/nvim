function! user#elixir#module_name() abort
  let l:module_name = user#snips#filename_camelized('MyModule')

  echom expand('%:p')
  if expand('%:p') =~# '/web/'
    return user#snips#dirname_camelized() . '.' . l:module_name
  else
    return l:module_name
  end
endfunction
