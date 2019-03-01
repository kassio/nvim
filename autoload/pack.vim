function! pack#load_and_update() abort
  execute printf("source %s", globpath(&runtimepath, "packs.vim"))
  call pack#update(0)
endfunction

function! pack#update(quit) abort
  try
    call minpac#clean()
  catch /.*/
    " noop
  finally
    call minpac#update('', { 'do': {-> s:finished(a:quit) } })
  endtry
endfunction

function! s:finished(quit) abort
  packloadall
  runtime! plugin/rplugin.vim
  UpdateRemotePlugins

  if a:quit
    qall!
  end
endfunction
