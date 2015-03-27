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
  echo a:command

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

nnoremap ,rr :call <sid>term_do(g:term_last_command)<cr>

" ==================================
" rspec
function! s:term_rspec(scope)
  let g:term_last_command = 'rspec'

  if a:scope == 'file'
    let g:term_last_command .= ' ' . expand('%:p')
  elseif a:scope == 'current'
    let g:term_last_command .= ' ' . expand('%:p') . ':' . line('.')
  endif

  call <sid>term_do(g:term_last_command)
endfunction

" ==================================
" minitest
function! s:term_minitest(scope)
  if a:scope == 'all'
    let g:term_last_command = 'rake test'
  elseif a:scope == 'file'
    let g:term_last_command = 'ruby -Itest ' . expand('%:p')
  elseif a:scope == 'current'
    let g:term_last_command = 'ruby -Itest ' . expand('%:p')
  endif

  call <sid>term_do(g:term_last_command)
endfunction

function! s:term_test_runner(scope)
  if g:term_test_lib == 'rspec'
    call <sid>term_rspec(a:scope)
  elseif g:term_test_lib == 'minitest'
    call <sid>term_minitest(a:scope)
  else
    echo 'g:term_test_lib not set'
  endif
endfunction
command! -nargs=? TermTestLib let g:term_test_lib=<q-args>

nnoremap <silent> ,rt :call <sid>term_test_runner('all')<cr>
nnoremap <silent> ,rf :call <sid>term_test_runner('file')<cr>
nnoremap <silent> ,rc :call <sid>term_test_runner('current')<cr>
