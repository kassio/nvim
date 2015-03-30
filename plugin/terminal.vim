let g:term_test_lib = ''
let g:term_last_command = ''

aug terminal_setup
  au TermOpen * let g:term_current_id = b:terminal_job_id
  au TermOpen * setlocal nonumber norelativenumber
  au BufUnload term://*
        \ if exists('g:term_current_id') |
        \   unlet g:term_current_id |
        \ endif

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

tnoremap <C-m> <C-\><C-n>

command! -nargs=? TermTestLib let g:term_test_lib=<q-args>
command! -nargs=+ T call terminal#do(<q-args>)
command! -nargs=+ Tmap exec "nnoremap ,tt :T " . <q-args> . "<CR>"

" closes the current terminal
nnoremap <silent> ,rc :bd! term://*<cr>

" redo last command
nnoremap ,rr :call terminal#do(g:term_last_command)<cr>

" run set test lib
nnoremap <silent> ,rt :call terminal#test_runner('all')<cr>
nnoremap <silent> ,rf :call terminal#test_runner('file')<cr>
nnoremap <silent> ,rn :call terminal#test_runner('current')<cr>
