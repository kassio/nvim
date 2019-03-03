function! pack#load_and_update() abort
  execute printf('source %s', globpath(&runtimepath, 'packs.vim'))
  call pack#update(0)
endfunction

function! pack#update(quit) abort
  call s:clean()
  call minpac#update('', { 'do': {-> PackPostInstall(a:quit) } })
endfunction

" minpac#clean always require an User input to confirm the deletion of the
" package, this is my hacky way to avoiding the input.
" This is required because the input doesn't work in neovim headless mode,
" which is used in `bin/pack`
function! s:clean()
  let l:packs = s:packages()

  for l:pack in l:packs
    if !has_key(g:minpac#pluglist, l:pack.name)
      if delete(l:pack.dir, 'rf') == 0
        echom printf('%s cleaned.', l:pack.name)
      else
        echom printf('Clean failed: %s', l:pack.name)
      end
    end
  endfor
endfunction

function! s:packages()
  let g:packs_folders = minpac#getpackages()
  let l:names = minpac#getpackages('', '', '', 1)
  let l:packs = map(l:names, { index, name ->
        \   { 'name': name, 'dir': g:packs_folders[index] }
        \ })
  unlet g:packs_folders

  return l:packs
endfunction
