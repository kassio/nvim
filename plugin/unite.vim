let g:unite_data_directory = expand('~/.vim_data/unite')

call unite#filters#sorter_default#use(['sorter_rank', 'sorter_selecta', 'sorter_length'])
call unite#filters#matcher_default#use('matcher_fuzzy')

call unite#custom#source('file_rec/async', 'ignore_pattern', '\.sass-cache')

nnoremap [unite] <Nop>
nmap <leader>u [unite]

nnoremap <silent>[unite]r :<C-u>Unite
      \ -buffer-name='file_rec/async'
      \ -start-insert
      \ -resume
      \ file_rec/async:!<CR>
nnoremap <silent>[unite]m :<C-u>Unite
      \ -buffer-name='file_mru'
      \ -start-insert
      \ -resume
      \ file_mru<CR>
nnoremap <silent>[unite]l :<C-u>Unite
      \ -buffer-name='line'
      \ -start-insert
      \ -resume
      \ line<CR>
nnoremap <silent>[unite]b :<C-u>Unite
      \ -buffer-name='buffer'
      \ -start-insert
      \ -resume
      \ -quick-match
      \ buffer<CR>

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  inoremap <silent><buffer><C-j> <nop>
  inoremap <silent><buffer><C-k> <nop>

  inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  inoremap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
  nmap <silent><buffer><expr> <C-s> unite#do_action('split')
  nmap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  nmap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  nmap <silent><buffer> <ESC> <Plug>(unite_exit)
  imap <silent><buffer> <ESC> <Plug>(unite_exit)
endfunction

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

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '-i --line-numbers --nocolor --nogroup --hidden'
  let g:unite_source_grep_recursive_opt = '-R'
elseif executable('ack')
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts = '-H -s --smart-case --column --nogroup --nocolor --follow'
  let g:unite_source_grep_recursive_opt = '-R'
endif

aug unite_cache_dir
  au!
  au VimEnter *
        \ if !isdirectory(g:unite_data_directory) |
        \   call mkdir(expand(g:unite_data_directory), "p", 0700) |
        \ endif
aug END
