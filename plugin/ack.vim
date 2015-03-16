let g:ackhighlight = 1
let g:ack_autoclose = 1
let g:ackprg = "ag"
let g:ack_default_options = "-U --silent --follow --column --smart-case"

vnoremap ,as :<C-u>exec 'Ack "' . text#escape_all(text#get_visual()) . '"'<CR>
nnoremap ,as :Ack<CR>
