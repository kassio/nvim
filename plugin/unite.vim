let g:unite_data_directory = expand('~/.vim_data/unite')

call unite#filters#sorter_default#use(['sorter_ftime', 'sorter_rank', 'sorter_word', 'sorter_length'])
call unite#filters#matcher_default#use('matcher_fuzzy')

call unite#custom#profile('default', 'context', { 'start_insert': 1, 'unique': 1, 'resume': 1 })
call unite#custom#profile('source/grep', 'context', { 'start_insert': 0, 'resume': 0 })
call unite#custom#source('file_rec/async', 'ignore_pattern', '\.sass-cache')

call unite#custom#profile('default', 'substitute_patterns', { 'pattern': '\v(^|\/)a/', 'subst': 'app/','priority': 0 })
call unite#custom#profile('default', 'substitute_patterns', { 'pattern': '\v(^|\/)c/', 'subst': 'controllers/', 'priority': 0 })
call unite#custom#profile('default', 'substitute_patterns', { 'pattern': '\v(^|\/)m/', 'subst': 'models/', 'priority': 0 })
call unite#custom#profile('default', 'substitute_patterns', { 'pattern': '\v(^|\/)v/', 'subst': 'views/', 'priority': 0 })

call unite#custom#action('file,buffer', 'choose', personal#unite#my_action('edit'))
call unite#custom#action('file,buffer', 'split', personal#unite#my_action('sbuffer'))
call unite#custom#action('file,buffer', 'vsplit', personal#unite#my_action('vertical sbuffer'))
call unite#custom#action('file,buffer', 'tabopen', personal#unite#my_action('tabedit'))

call unite#custom#default_action('file,file_rec,file_rec/async,buffer,file_mru,grep', 'choose')

autocmd FileType unite call personal#unite#settings()

command! -nargs=+ -complete=dir F call personal#unite#unite_grep(<q-args>)

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
