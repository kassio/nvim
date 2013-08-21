function! s:TmuxRunTest(full)
  let command = s:TestFrameworkSelector()

  if a:full == 'file' " run all file
    let g:lastTmuxCmd = command["command"].command["file"]."\n"
  else
    let g:lastTmuxCmd = command["command"].command["file"].command["line"]."\n"
  endif

  let g:lastTmuxCmd = "clear\n" . g:lastTmuxCmd

  call SendKeysToTmux('C-c')
  call SendToTmux(g:lastTmuxCmd)
endfunction

function! s:TestFrameworkSelector()
  let thisFile = expand("%")

  if match(thisFile, "_feature.rb") != -1 || match(thisFile, "_spec.rb") != -1
    return {
          \ "line": ":".line("."),
          \ "file": matchstr(expand("%"), "spec.*"),
          \ "command": s:TmuxRspecCommand()
          \ }
  elseif match(thisFile, "_test.rb") != -1
    return {
          \ "command": "ruby -I".matchstr(expand("%:h"), ".*test")." ",
          \ "file": expand('%'),
          \ "line": " -n /" . PreserveFN('TmuxTestUnitCurrentTest') . "/"
          \ }
  endif
endfunction

function! s:TmuxRspecCommand()
  let rspec_command = ""
  let file_path = expand("%:p:h")

  if (match(file_path, "AutoSeg") != -1) && (match(file_path, "cliente") == -1)
    let rspec_command .= "CLIENT_EXTENSIONS_DISABLED=true "
  endif

  let rspec_command .= "rspec "

  return rspec_command
endfunction

function! TmuxTestUnitCurrentTest()
  let current_test = search("def\ test_", "b")

  if current_test != 0
    let test_name = matchstr(getline(current_test), "test_.*")
  else
    let current_test = search('test\s["'']', 'b')

    let test_string = split(getline(current_test), '[''"]')[1]
    let test_name = join(split(tolower(test_string), " "), "_")
  endif

  return test_name
endfunction

nmap <leader>rf :call <SID>TmuxRunTest('file')<CR>
nmap <leader>rl :call <SID>TmuxRunTest('current')<CR>

nmap <leader>rr :call SendKeysToTmux('C-c')<CR>:call SendToTmux(g:lastTmuxCmd)<CR>
