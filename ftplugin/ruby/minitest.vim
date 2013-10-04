command! MinitestAutoComplete set completefunc=syntaxcomplete#Complete

function! s:Validator(file)
  return (match(a:file, "_test.rb") != -1)
endfunction

function! s:CommandBuilder(file, full)
  let command = "ruby -I".matchstr(a:file, ".*test")

  if a:full != 'all'
    let command .= " ".a:file

    if a:full == 'current'
      let command .= " -n /" . s:GetCurrentTest() . "/"
    endif
  endif

  return command
endfunction

function! s:GetCurrentTest()
  let winview = winsaveview()

  let current_test = search("def\ test_", "b")

  if current_test != 0
    let test_name = matchstr(getline(current_test), "test_.*")
  else
    let current_test = search('\(test\s["'']\|it\s["'']\)', 'b')

    let test_name = split(getline(current_test), '[''"]')[1]
  endif

  call winrestview(l:winview)
  return test_name
endfunction

let s:minitest = {
      \ "name": "minitest",
      \ "validate": function('s:Validator'),
      \ "run": function('s:CommandBuilder')
      \ }

call TmuxRunner.register(s:minitest)
