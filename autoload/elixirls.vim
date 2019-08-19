let g:elixirls = {}

function! elixirls#path()
  if !has_key(g:elixirls, 'path')
    let g:elixirls.path = '$HOME/.config/nvim/pack/minpac/opt/elixir-ls'
  end

  return g:elixirls.path
endfunction

function! elixirls#lsp()
  if !has_key(g:elixirls, 'path')
    let g:elixirls.lsp = printf(
          \ '%s/%s',
          \ elixirls#path(),
          \ 'release/language_server.sh')
  end

  return g:elixirls.lsp
endfunction

function! elixirls#exists()
  return filereadable(elixirls#lsp())
endfunction

function! elixirls#compile(...)
  if executable('mix')
    let l:commands = join([
          \ 'cd '.elixirls#path(),
          \ 'asdf install',
          \ 'mix local.hex --force',
          \ 'mix local.rebar --force',
          \ 'mix deps.get',
          \ 'mix compile',
          \ 'mix elixir_ls.release'
          \ ], ' && ')

    echom '>>> Compiling elixirls'
    echom l:commands
    call system(l:commands)
    echom '>>> elixirls compiled'
  else
    return
  end
endfunction
