nnoremap <silent> <c-p> :FZF<cr>
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }


aug fzf_setup
  au!
  au TermOpen term://*FZF tnoremap <silent> <buffer> <esc><esc> <c-c>
aug END
