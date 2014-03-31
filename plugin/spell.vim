if exists('b:spell_setup_loaded')
  finish
endif
let b:spell_setup_loaded=1

set spelllang=en,pt
noremap <F7> <esc>:set invspell<CR>
noremap <F6> zg
noremap <F8> z=
