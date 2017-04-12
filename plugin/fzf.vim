let $FZF_DEFAULT_OPTS='--no-reverse'

let g:fzf_buffers_jump = 1
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }

let g:fzf_history_dir = '~/.fzf-history'
let g:airline#extensions#branch#enabled = 0

command! FZFMru call fzf#run(fzf#wrap('MRU', { 'source': v:oldfiles }))

nnoremap <silent> <c-p> :FZF --no-sort<cr>
nnoremap <silent> <c-\> :FZFMru<cr>
nnoremap <silent> <c-n> :BLines<cr>
nnoremap <silent> <c-j> :BTags<cr>
nnoremap <silent> <c-k> :Buffers<cr>

if has('nvim')
  aug user:autocmd:fzf
    au!
    au TermOpen term://*FZF tnoremap <silent> <buffer> <nowait> <esc> <c-c>
  aug END
end
