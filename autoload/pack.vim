function! pack#update() abort
  call minpac#clean()
  call minpac#update('', { 'do': function('s:finished') })
endfunction

function! s:finished(...) abort
  packloadall
  runtime! plugin/rplugin.vim
  UpdateRemotePlugins
endfunction
