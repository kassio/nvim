function! test#elixir#run(scope)
  if len(g:neoterm.instances) == 0
    Tnew
  end

  try
    let l:path = expand('%')
    let l:elixir_path_changed = 0

    if l:path =~# '^apps/'
      let l:elixir_path_changed = 1
      execute 'lcd '.join(split(l:path, '/')[0:1], '/')
      call test#neoterm#scope(a:scope)
    end

  finally
    if l:elixir_path_changed
      lcd ../..
    end
  endtry
endfunction
