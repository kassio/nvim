let g:term_position = 'vertical'
let g:term_position = 1
let g:term_last_test_command = ''

aug terminal_setup
  au TermOpen * let g:term_current_id = b:terminal_job_id
  au TermOpen * setlocal nonumber norelativenumber
  au BufUnload term://*
        \ if exists('g:term_current_id') |
        \   unlet g:term_current_id |
        \ endif
  au BufUnload term://*
        \ if exists('g:term_repl_loaded') |
        \   unlet g:term_repl_loaded |
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

  " Ruby REPL
  au VimEnter,BufRead,BufNewFile *
        \ if filereadable('config/application.rb') |
        \   let g:term_repl_command = 'bundle exec rails console' |
        \ elseif &ft == 'ruby' |
        \   let g:term_repl_command = 'irb' |
        \ endif
aug END

function! HorizontalTerm(args)
  let l:term_default_pos = g:term_position
  let g:term_position = 'horizontal'

  call terminal#do(a:args)
  let g:term_position = l:term_default_pos
endfunction

function! VerticalTerm(args)
  let l:term_default_pos = g:term_position
  let g:term_position = 'vertical'

  call terminal#do(a:args)
  let g:term_position = l:term_default_pos
endfunction

command! -nargs=? TTestLib let g:term_test_lib=<q-args>
command! -nargs=1 Tpos let g:term_position=<q-args>
command! -nargs=+ T call HorizontalTerm(<q-args>)
command! -nargs=+ Tmap exec "nnoremap <silent> ,tt :T " . <q-args> . "<cr>"
command! -nargs=+ VT call VTerm(<q-args>)
command! -nargs=+ VTmap exec "nnoremap <silent> ,tt :VT " . <q-args> . "<cr>"

command! -range=% REPLSendSelection call terminal#repl(text#get_visual_lines())
command! REPLSendLine call terminal#repl([getline('.')])

nnoremap <silent> <f9> :REPLSendLine<cr>
vnoremap <silent> <f9> :REPLSendSelection<cr>

" run set test lib
nnoremap <silent> ,rt :call terminal#test_runner('all')<cr>
nnoremap <silent> ,rf :call terminal#test_runner('file')<cr>
nnoremap <silent> ,rn :call terminal#test_runner('current')<cr>
" redo last test command
nnoremap <silent>,rr :call terminal#do(g:term_last_test_command)<cr>

" Useful maps
" closes the current terminal
nnoremap <silent> ,tc :bd! term://*<cr>
" clear terminal
nnoremap <silent> ,tl :T hr<cr>
