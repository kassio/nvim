noremap <leader>tc :call TmuxRunner.sendKeys('C-c')<CR>
noremap <leader>tl :call TmuxRunner.sendKeys('C-c C-l')<CR>
noremap <leader>tp :call TmuxRunner.sendKeys('C-c C-l C-p Enter')<CR>

noremap <leader>tr :call TmuxRunner.setTmuxPane()<CR>
noremap <leader>ct :call TmuxRunner.selectRunner()<CR>

" run all tests
noremap <leader>rt :call TmuxRunner.run('unscoped')<CR>
" run current file
noremap <leader>rf :call TmuxRunner.run('file')<CR>
" run nearest test
noremap <leader>rn :call TmuxRunner.run('nearest')<CR>
" run customized scope
noremap <leader>rc :call TmuxRunner.run('custom')<CR>
noremap <leader>rr :call TmuxRunner.sendKeys('C-c C-l') \|
      \ call TmuxRunner.reExecute()<CR>
