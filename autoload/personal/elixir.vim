function! personal#elixir#module_name()
  let module_name = personal#snips#filename_camelized()

  echom expand('%:p')
  if expand('%:p') =~ "/web/"
    return personal#snips#dirname_camelized() . '.' . module_name
  else
    return module_name
  end
endfunction
