nnoremap <silent> <nowait> <c-p> :FZF<cr>
nnoremap <silent> <c-m> :FZFMru<cr>
nnoremap <silent> <c-n> :BLines<cr>
nnoremap <silent> <c-k> :Buffers<cr>

command! FZFMru call fzf#run(fzf#wrap({
      \ 'source': v:oldfiles
      \ }))

let g:fzf_buffers_jump = 1

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }

let g:fzf_history_dir = '~/.fzf-history'
let g:airline#extensions#branch#enabled = 0

if has('nvim')
  aug fzf_setup
    au!
    au TermOpen term://*FZF tnoremap <silent> <buffer> <nowait> <esc> <c-c>
  aug END
end
