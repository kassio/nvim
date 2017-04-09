let g:neomake_verbose = 0
let g:neomake_place_signs = 1

let g:neomake_elixir_enabled_makers = ['mix']
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_javascript_enabled_makers = ['eslint']

" I don't know where, but somewhere on my configuration has an
" `autocmd FileType javascript let g:neomake_place_signs = 0`
" which makes the signify signs override the neomake ones.  I searched in a
" lot of codes, tried a lot of custom vimrc files, and wasn't able to found
" the where the autocmd is defined.
"
" This watcher enforces that the `g:neomake_place_signs` will always be `1`,
" even when someone tries to update it.
function! EnsureNeomakePlaceSigns(dictionary, key, values)
  let g:neomake_place_signs = 1
endfunction
call dictwatcheradd(g:, 'neomake_place_signs', 'EnsureNeomakePlaceSigns')
