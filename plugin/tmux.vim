noremap <leader>tc :call TmuxRunner.sendKeys('C-c')<CR>
noremap <leader>tl :call TmuxRunner.sendKeys('C-c C-l')<CR>
noremap <leader>tp :call TmuxRunner.sendKeys('C-c C-l C-p Enter')<CR>

noremap <leader>tr :call TmuxRunner.setTmuxPane()<CR>
noremap <leader>ct :call TmuxRunner.selectRunner()<CR>

noremap <leader>rt :call TmuxRunner.run('unscoped')<CR>
noremap <leader>rf :call TmuxRunner.run('file')<CR>
noremap <leader>rl :call TmuxRunner.run('current')<CR>
noremap <leader>rr :call TmuxRunner.sendKeys('C-c C-l')<CR>
      \ :call TmuxRunner.execute(TmuxRunner.lastCommand)<CR>
