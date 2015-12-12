set statusline=

aug statusline
  au!
  au VimEnter,WinEnter,BufWinEnter,FileType,BufUnload,VimResized *
        \ call statusline#update()
aug END
