let g:unite_data_directory = expand('~/.vim_data/unite')

call unite#filters#sorter_default#use('sorter_rank')
call unite#filters#matcher_default#use('matcher_fuzzy')

call unite#custom#profile('default', 'context', {
      \ 'start_insert' : 1,
      \ 'resume': 1
      \ })

nnoremap   [unite] <Nop>
nmap <leader>u [unite]

nnoremap <silent>[unite]r :<C-u>Unite
      \ -buffer-name='file_rec/async'
      \ file_rec/async:!<CR>
nnoremap <silent>[unite]m :<C-u>Unite
      \ -buffer-name='file_mru'
      \ file_mru<CR>
nnoremap <silent>[unite]l :<C-u>Unite
      \ -buffer-name='line'
      \ line<CR>
nnoremap <silent>[unite]b :<C-u>Unite
      \ -buffer-name='bufer'
      \ -quick-match
      \ buffer<CR>

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  inoremap <silent><buffer><C-j> <nop>
  inoremap <silent><buffer><C-k> <nop>
  inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  inoremap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

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

function! s:uniteGrep(text)
  let list = split(a:text, ':')

  if len(list) == 1
    let place = '.'
    let term = escape(get(list, 0), ' \')
  else
    let place = get(list, 0)
    let term = escape(get(list, 1), ' \')
  endif

  execute 'Unite -no-resume grep:' . place . '::' . term
endfunction
command! -nargs=+ -complete=dir F call <SID>uniteGrep(<q-args>)

function! s:uniteLocalGrep(term)
  execute 'Unite -no-resume grep:.::' . a:term
endfunction
vnoremap ,as :<C-u>call <SID>uniteLocalGrep(text#escape_all(text#get_visual()))<CR>
nnoremap ,as :<C-u>call <SID>uniteLocalGrep(expand('<cword>'))<CR>

aug unite_cache_dir
  au!
  au VimEnter *
        \ if !isdirectory(g:unite_data_directory) |
        \   call mkdir(expand(g:unite_data_directory), "p", 0700) |
        \ endif
aug END
