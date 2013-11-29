function! s:Validator(file)
  return 1
endfunction

function! s:CommandBuilder(file, full)
  let command = "mix test"

  return command
endfunction

let s:mix = {
      \ "name": "mix",
      \ "validate": function('s:Validator'),
      \ "commandFor": function('s:CommandBuilder')
      \ }

call TmuxRunner.register(s:mix)
