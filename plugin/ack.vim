function! VAckSearch()
  norm! gv"sy
  return ':MyAck "' . EscapeAllString(@s) . '"'
endfunction

function! EscapeAllString(text)
  return substitute(escape(a:text, '*^$.?/\|{[()]}'), '\n', '\\n', 'g')
endfunction

let g:ack_apply_qmappings=1
let g:ack_qhandler="cw 5"
let g:ackhighlight=1
let g:ackprg="ack --smart-case --column --follow"

vnoremap ,as :<C-u>exec VAckSearch()<CR>
nnoremap ,as :MyAck<CR>

function! MyAck(args)
  let l:cmd = "Ack " . (empty(a:args) ? expand('<cword>') : a:args)
  tabnew
  echo l:cmd
  exe l:cmd
endfunction

command! -bang -nargs=* -complete=file MyAck call MyAck(<q-args>)
