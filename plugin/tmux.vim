command! -nargs=? TRKillProcess
      \ call TmuxRunner.sendKeys('C-c C-c') |
      \ if <q-args> != "" |
      \   execute "call " . <q-args> |
      \ endif
command! -nargs=? TRKillClear
      \ call TmuxRunner.sendKeys('C-c C-c C-l') |
      \ if <q-args> != "" |
      \   execute "call " . <q-args> |
      \ endif

noremap <leader>tc :TRKillProcess<CR>
noremap <leader>tl :TRKillClear<CR>
noremap <leader>tp :TRKillClear TmuxRunner.sendKeys('C-p Enter')<CR>

noremap <leader>tr :call TmuxRunner.setTmuxPane()<CR>
noremap <leader>ct :call TmuxRunner.selectRunner()<CR>

" run all tests
noremap <leader>rt :TRKillClear TmuxRunner.run('unscoped')<CR>
" run current file
noremap <leader>rf :TRKillClear TmuxRunner.run('file')<CR>
" run nearest test
noremap <leader>rn :TRKillClear TmuxRunner.run('nearest')<CR>
" run customized scope
noremap <leader>rc :TRKillClear TmuxRunner.run('custom')<CR>
noremap <leader>rr :TRKillClear TmuxRunner.reExecute()<CR>

cnoreabbrev t Tmux
