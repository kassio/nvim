function! VAckSearch()
  return ':Ack "' . EscapeAllString(visual_text#get()) . '"'
endfunction

function! EscapeAllString(text)
  return substitute(escape(a:text, '*^$.?/\|{[()]}'), '\n', '\\n', 'g')
endfunction

let g:ack_qhandler="botright cwindow 5"
let g:ack_apply_qmappings = 1
let g:ackhighlight=1
let g:ackprg="ack -H --nocolor --nogroup --column --smart-case --follow"

vnoremap ,as :<C-u>exec VAckSearch()<CR>
nnoremap ,as :Ack<CR>

cnoreabbrev ack Ack
