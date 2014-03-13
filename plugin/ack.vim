function! VAckSearch()
  norm! gv"sy
  return ':Ack "' . EscapeAllString(@s) . '"'
endfunction

function! EscapeAllString(text)
  return substitute(escape(a:text, '*^$.?/\|{[()]}'), '\n', '\\n', 'g')
endfunction

let g:ack_qhandler="botright cwindow 5"
let g:ackhighlight=1
let g:ackprg="ack -H --nocolor --nogroup --column --smart-case --follow"

vnoremap ,as :<C-u>exec VAckSearch()<CR>
nnoremap ,as :Ack<CR>
