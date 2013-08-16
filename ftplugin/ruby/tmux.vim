function! RunTest(...)
  let s:command = SelectTestCommand()

  if a:0 " run all file
    let g:lastTmuxCmd = s:command["command"].s:command["file"]."\n"
  else
    let g:lastTmuxCmd = s:command["command"].s:command["file"].s:command["line"]."\n"
  endif

  let g:lastTmuxCmd = "clear\n" . g:lastTmuxCmd

  call Send_keys_to_Tmux('C-c')
  call Send_to_Tmux(g:lastTmuxCmd)
endfunction

function! SelectTestCommand()
  let s:thisFile = expand("%")

  if match(s:thisFile, "_feature.rb") != -1 || match(s:thisFile, "_spec.rb") != -1
    return AutoSegRSpecSelector()
  elseif match(s:thisFile, "_test.rb") != -1
    return {
          \ "command": "ruby -I".matchstr(expand("%:h"), ".*test")." ",
          \ "file": expand('%'),
          \ "line": " -n /" . GetCurrentTest() . "/"
          \ }
  endif
endfunction

function! AutoSegRSpecSelector()
  let s:file_path = expand("%:p:h")
  let s:data = {
        \ "line": ":".line("."),
        \ "file": matchstr(expand("%"), "spec.*"),
        \ "command": ""
        \ }

  if (match(s:file_path, "AutoSeg") != -1) && (match(s:file_path, "cliente") == -1)
      let s:data["command"] = s:data["command"] . "CLIENT_EXTENSIONS_DISABLED=true "
  endif

    let s:data["command"] = s:data["command"] . "rspec "

  return s:data
endfunction

function! GetCurrentTest()
  let s:line = search("def\ test_", "b")
  return matchstr(getline(s:line), 'def\s\zstest_.*')
endfunction

nmap <leader>rf :call RunTest(1)<CR>
nmap <leader>rl :call RunTest()<CR>

nmap <leader>rr :call Send_keys_to_Tmux('C-c')<CR>:call Send_to_Tmux(g:lastTmuxCmd)<CR>

nmap <leader>rp :call Send_to_Tmux("rake spec:padrao:all\n")<CR>
nmap <leader>rc :call Send_to_Tmux("rake spec:client:all\n")<CR>
