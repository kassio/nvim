function! VAckSearch()
norm! gv"sy
return ':Ag "' . EscapeAllString(@s) . '"'
endfunction

function! EscapeAllString(text)
return substitute(escape(a:text, '*^$.?/\|{[()]}'), '\n', '\\n', 'g')
endfunction

vnoremap ,ag :<C-u>exec VAgSearch()<CR>
nnoremap ,ag :Ag<CR>

