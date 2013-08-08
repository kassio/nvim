function! SendToTmux(append)
  let s:thisFile = expand("%")

  if match(s:thisFile, "_spec.rb") != -1
    let s:tmuxCmd = "bundle exec rspec "
  elseif match(s:thisFile, "_feature.rb") != -1
    let s:tmuxCmd = "bundle exec rspec "
  elseif match(s:thisFile, ".feature") != -1
    let s:tmuxCmd = "bundle exec cucumber "
  elseif match(s:thisFile, ".rb") != -1
    let s:tmuxCmd = "ruby "
  else
    let s:tmuxCmd = "."
  endif

  let g:lastTmuxCmd=s:tmuxCmd.s:thisFile.a:append."\n"
  call Send_to_Tmux(g:lastTmuxCmd)
endfunction

nmap <leader>t :call SendToTmux(":".line("."))<CR>
nmap <leader>T :call SendToTmux("")<CR>

nmap <leader>r :call Send_to_Tmux(g:lastTmuxCmd)<CR>
