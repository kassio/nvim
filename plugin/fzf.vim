" Load FZF from homebrew installation
set runtimepath^=/usr/local/opt/fzf
runtime plugin/fzf.vim

let $FZF_DEFAULT_OPTS='--no-reverse'
let g:fzf_history_dir = '~/.fzf-history'
let g:fzf_buffers_jump = 1
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }
let g:fzf_tags_command = 'retag'
let g:fzf_layout = { 'down': '100%', 'window': 'call FloatingFZF()' }

command! FZFMru call fzf#run(fzf#wrap('MRU', { 'source':  MRUfiles() }))
command! -bang -nargs=* Grep
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview('up:60%')
      \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
      \                 <bang>0)

nnoremap <silent> <c-p> :FZF --tiebreak=begin,length,index<cr>
nnoremap <silent> <c-\> :FZFMru<cr>
nnoremap <silent> <c-n> :BLines<cr>
nnoremap <silent> <c-j> :BTags<cr>
nnoremap <silent> <c-k> :Buffers<cr>
vnoremap <leader>as :<c-u>exec 'Grep '.text#get_visual()<cr>
nnoremap <leader>as :exec 'Grep '.expand('<cword>')<cr>

function! MRUfiles()
  let l:ignore = 'fugitive:\|NERD_tree\|^/tmp/\|.git/\|term:'
  let l:files = extend(
        \ filter(copy(v:oldfiles), { _, f -> f !~ l:ignore }),
        \ map(filter(range(1, bufnr('$')), { _, f -> buflisted(f) }), { _, f -> bufname(f) }))
  let l:pwd = getcwd()
  return filter(copy(l:files), { _, f -> f =~ l:pwd })
endfunction

if has('nvim')
  aug user:autocmd:fzf
    au!
    au TermOpen term://*FZF tnoremap <silent> <buffer> <nowait> <esc> <c-c>
  aug END
end

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let winheight = winheight(0)
  let winwidth = winwidth(0)

  let width = float2nr(winwidth-(winwidth*2/10))

  let opts = {
        \ 'relative': 'editor',
        \ 'row': 1,
        \ 'col': float2nr((winwidth-width)/2),
        \ 'width': width,
        \ 'height': winheight
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
