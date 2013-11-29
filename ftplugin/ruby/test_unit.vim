function! s:Validator(file)
  return (match(a:file, "_test.rb") != -1)
endfunction

function! s:CommandBuilder(file, scope)
  if a:scope == "all"
    let command = "rake test"
  else
    let command = "ruby -Itest ".a:file

    if a:scope == "current"
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
    let current_test = search('\(test\s["'']\|it\s["'']\)', "b")

    let test_string = split(getline(current_test), '[''"]')[1]
    let test_name = substitute(tolower(test_string), "\ ", "_", "g")
  endif

  call winrestview(l:winview)
  return test_name
endfunction

let s:test_unit = {
      \ "name": "test_unit",
      \ "validate": function("s:Validator"),
      \ "commandFor": function("s:CommandBuilder")
      \ }

call TmuxRunner.register(s:test_unit)
