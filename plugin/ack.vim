let g:ack_qhandler = "botright cwindow 5"
let g:ack_apply_qmappings = 1
let g:ackhighlight = 1
let g:ack_autofold_results = 1
let g:ackprg = "ack -s -H --column --smart-case --follow"

vnoremap ,as :<C-u>exec 'Ack "' . text#escape_all(text#get_visual()) . '"'<CR>
nnoremap ,as :Ack<CR>

cnoreabbrev ack Ack
