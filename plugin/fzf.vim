nnoremap <silent> <c-p> :FZF<cr>
nnoremap <silent> <m-p> :FZFMru<cr>
nnoremap <silent> <c-n> :BLines<cr>
nnoremap <silent> <c-j> :BTags<cr>
nnoremap <silent> <c-k> :Buffers<cr>

command! FZFMru call fzf#run(fzf#wrap(
      \   'MRU',
      \   { 'source': v:oldfiles }
      \   )
      \ )

command! -bang -nargs=* Find call
      \ fzf#vim#grep(
      \ 'rg '.$RG_OPTIONS.' --column --line-number --no-heading --fixed-strings --ignore-case '.shellescape(<q-args>),
      \ 1,
      \ <bang>0
      \ )

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
    au User FzfStatusLine call <SID>fzf_statusline()
  aug END
end

function! s:fzf_statusline()
  let fzf_cmd_name = get(b:fzf, 'name', 'FZF')
  let &l:statusline = '> '.fzf_cmd_name
endfunction
