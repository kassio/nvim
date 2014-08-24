call unite#custom#source('grep', 'context', {
      \ 'start_insert': 0,
      \ 'focus': 0,
      \ 'resume': 0
      \ })

function! s:uniteGrep(text)
  let list = split(a:text, ':')

  if len(list) == 1
    let place = '.'
    let term = escape(get(list, 0), ' \')
  else
    let place = get(list, 0)
    let term = escape(get(list, 1), ' \')
  endif

  execute 'Unite grep:' . place . '::' . term
endfunction
command! -nargs=+ -complete=dir F call <SID>uniteGrep(<q-args>)

function! s:uniteLocalGrep(term)
  execute 'Unite grep:.::' . a:term
endfunction
vnoremap ,as :<C-u>call <SID>uniteLocalGrep(text#escape_all(text#get_visual()))<CR>
nnoremap ,as :<C-u>call <SID>uniteLocalGrep(expand('<cword>'))<CR>

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '-i --line-numbers --nocolor --nogroup --hidden'
  let g:unite_source_grep_recursive_opt = '-R'
elseif executable('ack')
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts = '-H -s --smart-case --column --nogroup --nocolor --follow'
  let g:unite_source_grep_recursive_opt = '-R'
endif
