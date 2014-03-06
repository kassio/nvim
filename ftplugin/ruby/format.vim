command! -range NewRubyHashSyntax
      \ call Preserve(<line1>.','.<line2>.'s/\v:(\w+)\s*\=\>\s*/\1:\ /ge')
command! -range OldRubyHashSyntax
      \ call Preserve(<line1>.','.<line2>.'s/\v(\w+):\s*\ze[^:]/:\1\ =>\ /ge')
