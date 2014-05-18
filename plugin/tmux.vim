noremap <silent> <leader>tr :call TmuxRunner.setTmuxPane()<CR>
noremap <silent> <leader>ct :call TmuxRunner.setRunner()<CR>

noremap <silent> <leader>tc :call TRKill()<CR>
noremap <silent> <leader>tl :call TmuxRunner.send('C-l')<CR>
noremap <silent> <leader>tp :call TmuxRunner.send('C-p Enter')<CR>

noremap <silent> <leader>rt :call TmuxRunner.runUnscoped()<CR>
noremap <silent> <leader>rf :call TmuxRunner.runFile()<CR>
noremap <silent> <leader>rn :call TmuxRunner.runNearest()<CR>
noremap <silent> <leader>rc :call TmuxRunner.runCustom()<CR>

noremap <silent> <leader>rr :call TmuxRunner.reExecute()<CR>

cnoreabbrev tm Tmux
cnoreabbrev Map MapTmuxCmd
