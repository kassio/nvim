let g:elixirls = {}

function! elixirls#path()
  if !has_key(g:elixirls, 'path')
    let g:elixirls.path = printf(
          \ '%s/%s',
          \ stdpath('config'),
          \ 'pack/minpac/opt/elixir-ls')
  end

  return g:elixirls.path
endfunction

function! elixirls#lsp()
  if !has_key(g:elixirls, 'path')
    let g:elixirls.path = printf(
          \ '%s/%s',
          \ elixirls#path(),
          \ 'release/language_server.sh')
  end

  return g:elixirls.path
endfunction

function! elixirls#exists()
  return filereadable(elixirls#lsp())
endfunction

function! elixirls#compile(...)
  let l:commands = join([
        \ 'mix local.hex --force',
        \ 'mix local.rebar --force',
        \ 'mix deps.get',
        \ 'mix compile',
        \ 'mix elixir_ls.release'
        \ ], '&&')

  echom '>>> Compiling elixirls'
  call system(l:commands)
  echom '>>> elixirls compiled'
endfunction
