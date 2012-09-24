" Ack
function! VAckSearch()
let temp = @s
norm! gv"sy
return ':Ack "' . EscapeAllString(@s) . '"'
endfunction

function! EscapeAllString(text)
return substitute(escape(a:text, '.?/\|{[()]}'), '\n', '\\n', 'g')
endfunction

let g:ackprg="ack -H -i --column --follow"
let g:ackhighlight=1
vnoremap ,as :<C-u>exec VAckSearch()<CR>
nnoremap ,as :Ack<CR>
