function! RunTest(...)
  let s:thisFile = expand("%")
  let command = SelectTestCommand()

  if a:0 " run all file
    let g:lastTmuxCmd = command["command"].s:thisFile."\n"
  else
    let g:lastTmuxCmd = command["command"].s:thisFile.command["line"]."\n"
  endif

  call Send_to_Tmux(g:lastTmuxCmd)
endfunction

function! SelectTestCommand()
  let s:thisFile = expand("%")

  if match(s:thisFile, "_feature.rb") != -1 || match(s:thisFile, "_spec.rb") != -1
    return {
          \ "command": AutoSegRSpecSelector(),
          \ "line": ":".line(".")
          \ }
  elseif match(s:thisFile, "_test.rb") != -1
    return {
          \ "command": "ruby -I".expand("%:p:h")." ",
          \ "line": " -n /" . GetCurrentTest() . "/"
          \ }
  endif
endfunction

function! AutoSegRSpecSelector()
  let s:file_path = expand("%:p:h")

  if match(s:file_path, "AutoSeg") != -1
    if match(s:file_path, "cliente") != -1
      return "bundle exec rake spec:client:all SPEC="
    else
      return "bundle exec rake spec:padrao:all SPEC="
    endif
  else
    return "bundle exec rspec "
  endif
endfunction

function! GetCurrentTest()
  let s:line = search("def\ test_", "b")
  return matchstr(getline(s:line), 'def\s\zstest_.*')
endfunction

nmap <leader>rf :call RunTest(1)<CR>
nmap <leader>rl :call RunTest()<CR>

nmap <leader>rr :call Send_to_Tmux(g:lastTmuxCmd)<CR>

nmap <leader>rp :call Send_to_Tmux("bundle exec rake spec:padrao:all\n")<CR>
nmap <leader>rc :call Send_to_Tmux("bundle exec rake spec:client:all\n")<CR>
