let g:unite_data_directory = expand('~/.vim_data/unite')

call unite#filters#sorter_default#use(['sorter_rank', 'sorter_selecta', 'sorter_length'])
call unite#filters#matcher_default#use('matcher_fuzzy')

call unite#custom#source('file_rec/async', 'ignore_pattern', '\.sass-cache')

call unite#custom#profile('default', 'context', {
      \   'start_insert': 1,
      \   'resume': 1
      \ })

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

let my_open = { 'is_selectable' : 1 }
function! my_open.func(candidates)
  let l:bname = a:candidates[0].action__path
  if bufexists(l:bname)
    execute 'sbuffer ' . l:bname
  else
    execute 'badd ' . l:bname
    execute 'sbuffer ' . l:bname
  end
endfunction
call unite#custom_action('file,buffer', 'my_open', my_open)
call unite#custom#default_action('file,file_rec,file_rec/async,buffer,file_mru', 'my_open')

let my_tabopen = { 'is_selectable' : 1 }
function! my_tabopen.func(candidates)
  let l:bname = a:candidates[0].action__path
  echo l:bname

  if bufexists(l:bname)
    execute 'sbuffer ' . l:bname
  else
    execute 'tabedit ' .l:bname
  endif
endfunction
call unite#custom#action('file,buffer', 'tabopen', my_tabopen)

autocmd FileType unite call personal#unite#settings()

aug unite_cache_dir
  au!
  au VimEnter *
        \ if !isdirectory(g:unite_data_directory) |
        \   call mkdir(expand(g:unite_data_directory), "p", 0700) |
        \ endif
aug END
