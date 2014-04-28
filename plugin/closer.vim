let g:closer_stack = []
let g:closers = {
      \ "'": "'",
      \ '"': '"',
      \ "(": ")",
      \ "[": "]",
      \ "{": "}"
      \ }

for sym in keys(g:closers)
  if sym == '"'
    execute printf("inoremap %s<TAB> <C-R>=closer#open(%s%s%s)<CR><LEFT>", sym, "'",  sym, "'")
  else
    execute printf("inoremap %s<TAB> <C-R>=closer#open(%s%s%s)<CR><LEFT>", sym, '"',  sym, '"')
  endif
endfor
