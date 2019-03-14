let g:elixirls_path = printf(
      \ '%s/%s',
      \ stdpath('config'),
      \ 'pack/minpac/opt/elixir-ls/'
      \ )

function! elixirls#compile(...)
  let l:commands = join([
        \ printf('cd %s', g:elixirls_path),
        \ 'mix local.hex --force',
        \ 'mix local.rebar --force',
        \ 'mix deps.get',
        \ 'mix compile',
        \ 'mix elixir_ls.release'
        \ ], '&&')

  let l:opts = { 'on_stdout': function('s:echo') }

  call jobstart(l:commands)
endfunction

function! s:echo(msg)
  echo a:msg
endfunction
