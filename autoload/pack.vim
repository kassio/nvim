function! pack#update(quit) abort
  call minpac#clean()
  call minpac#update('', { 'do': function('s:finished', [a:quit]) })
endfunction

function! s:finished(...) abort
  packloadall
  runtime! plugin/rplugin.vim
  UpdateRemotePlugins

  if get(a:, 1, 0)
    qall!
  end
endfunction
