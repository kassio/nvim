let g:term_test_lib = ''
let g:term_last_command = ''
let g:term_current = ''

aug terminal_setup
  au TermOpen * let g:term_current = b:terminal_job_id
  au TermOpen * setlocal nonumber norelativenumber

  " rspec
  au VimEnter,BufRead,BufNewFile *_spec.rb,*_feature.rb let g:term_test_lib = 'rspec'
  au VimEnter *
        \ if filereadable('spec/spec_helper.rb') |
        \   let g:term_test_lib = 'rspec' |
        \ endif

  " minitest
  au VimEnter,BufRead,BufNewFile *_test.rb let g:term_test_lib = 'minitest'
  au VimEnter *
        \ if filereadable('test/test_helper.rb') |
        \   let g:term_test_lib = 'minitest' |
        \ endif
aug END

function! s:term_do(command)
  if exists('g:term_current') && g:term_current
    try
      call jobsend(g:term_current, add([a:command], ''))
    cat /E900/
      botright new | call termopen(a:command)
    endtry
  else
    botright new | call termopen(a:command)
  end
endfunction

command! -nargs=+ Term call <sid>term_do(<q-args>)
" Terminal redo
nnoremap ,rr :call <sid>term_do(g:term_last_command)<cr>

function! s:term_test_runner(scope)
  let Fn = function('terminal#' . g:term_test_lib)
  let command = Fn(a:scope)
  call <sid>term_do(command)
endfunction
command! -nargs=? TermTestLib let g:term_test_lib=<q-args>

nnoremap <silent> ,rt :call <sid>term_test_runner('all')<cr>
nnoremap <silent> ,rf :call <sid>term_test_runner('file')<cr>
nnoremap <silent> ,rn :call <sid>term_test_runner('current')<cr>
