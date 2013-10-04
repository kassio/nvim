command! LetToVariable call Preserve("%s/\vlet.?\(:(.{-})\)\s\{\s(\_.{-})\s\}/@\1\ =\ \2/ge")

function! s:Validator(file)
  return (match(a:file, "_feature.rb") != -1)
        \ || (match(a:file, "_spec.rb") != -1)
endfunction

function! s:CommandBuilder(file, full)
  let command = s:selectRspecCommand(a:file)

  if a:full != "all"
    let command .= " ".matchstr(a:file, "spec.*")

    if a:full == "current"
      let command .= ":".line(".")
    endif
  endif

  return command
endfunction

function! s:selectRspecCommand(file)
  let rspec_command = ""

  if (match(a:file, "\cautoseg") != -1) && (match(a:file, "\ccliente") == -1)
    let rspec_command .= "CLIENT_EXTENSIONS_DISABLED=true "
  endif

  let rspec_command .= "rspec"

  return rspec_command
endfunction

let s:rspec = {
      \ "name": "rspec",
      \ "validate": function("s:Validator"),
      \ "run": function("s:CommandBuilder")
      \ }

call TmuxRunner.register(s:rspec)
