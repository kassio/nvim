let g:unite_data_directory = expand('~/.vim_data/unite')

call unite#filters#sorter_default#use('sorter_rank')
call unite#filters#matcher_default#use('matcher_fuzzy')

call unite#custom#profile('default', 'substitute_patterns', {
      \ 'pattern': '\v(^|\/)a/',
      \ 'subst': 'app/',
      \ 'priority': 0
      \ })
call unite#custom#profile('default', 'substitute_patterns', {
      \ 'pattern': '\v(^|\/)c/',
      \ 'subst': 'controllers/',
      \ 'priority': 0
      \ })
call unite#custom#profile('default', 'substitute_patterns', {
      \ 'pattern': '\v(^|\/)m/',
      \ 'subst': 'models/',
      \ 'priority': 0
      \ })
call unite#custom#profile('default', 'substitute_patterns', {
      \ 'pattern': '\v(^|\/)v/',
      \ 'subst': 'views/',
      \ 'priority': 0
      \ })

call unite#custom#profile('default', 'context', {
      \ 'start_insert' : 1,
      \ 'resume': 1
      \ })

nnoremap <silent><C-p> :<C-u>Unite
      \ -buffer-name='file_rec/async'
      \ file_rec/async:!<CR>
nnoremap <silent><C-m> :<C-u>Unite
      \ -buffer-name='file_mru'
      \ file_mru<CR>
nnoremap <silent><C-n> :<C-u>Unite
      \ -buffer-name='line'
      \ line<CR>

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  inoremap <silent><buffer><C-j> <nop>
  inoremap <silent><buffer><C-k> <nop>
  inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  inoremap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  nmap <silent><buffer> <ESC> <Plug>(unite_exit)
endfunction

aug unite_cache_dir
  au!
  au VimEnter *
        \ if !isdirectory(g:unite_data_directory) |
        \   call mkdir(expand(g:unite_data_directory), "p", 0700) |
        \ endif
aug END
