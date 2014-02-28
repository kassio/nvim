noremap <silent> <leader>tr :call TmuxRunner.setTmuxPane()<CR>
noremap <silent> <leader>ct :call TmuxRunner.setRunner()<CR>

noremap <silent> <leader>tc :call TRKill()<CR>
noremap <silent> <leader>tl :call TRClear()<CR>
noremap <silent> <leader>tp :call TmuxRunner.sendKeys('C-p Enter', 'TRClear')<CR>

noremap <silent> <leader>rt :call TmuxRunner.runUnscoped('TRClear')<CR>
noremap <silent> <leader>rf :call TmuxRunner.runFile('TRClear')<CR>
noremap <silent> <leader>rn :call TmuxRunner.runNearest('TRClear')<CR>
noremap <silent> <leader>rc :call TmuxRunner.runCustom('TRClear')<CR>

noremap <silent> <leader>rr :call TmuxRunner.reExecute('TRClear')<CR>

cnoreabbrev tm Tmux

function! TRKill()
  silent call g:TmuxRunner.sendKeys('C-c')
  sleep 30 m
endfunction

function! TRClear()
  silent call TRKill()
  silent call g:TmuxRunner.sendKeys('C-l')
endfunction
