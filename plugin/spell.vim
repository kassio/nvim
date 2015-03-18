let g:custom_spell_dir = '~/.vim_data/spell'
let g:custom_spell_file = expand(g:custom_spell_dir . '/custom.utf-8.add')
let &spellfile = expand(g:custom_spell_file)
set spelllang=en,pt
noremap <F7> <esc>:set invspell<CR>
noremap <F6> zg
noremap <F8> z=

aug custom_spell_dir
  au!
  au VimEnter *
        \ if !filewritable(g:custom_spell_file) |
        \   call mkdir(expand(g:custom_spell_dir), "p", 0700) |
        \   call system('touch ' . g:custom_spell_file) |
        \ endif
aug END
