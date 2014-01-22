function! VAckSearch()
  norm! gv"sy
  return ':Ack "' . EscapeAllString(@s) . '"'
endfunction

function! EscapeAllString(text)
  return substitute(escape(a:text, '*^$.?/\|{[()]}'), '\n', '\\n', 'g')
endfunction

let g:ack_apply_qmappings=1
let g:ack_qhandler="cw 5"
let g:ackhighlight=1
let g:ackprg="ack --smart-case --column --follow"

vnoremap ,as :<C-u>exec VAckSearch()<CR>
nnoremap ,as :Ack<CR>
