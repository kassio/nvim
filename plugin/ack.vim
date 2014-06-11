let g:ack_apply_qmappings = 1
let g:ackhighlight = 1
let g:ack_default_options = ' -s -H --smart-case --nogroup --nocolor --column --follow'

vnoremap ,as :<C-u>exec 'Ack "' . text#escape_all(text#get_visual()) . '"'<CR>
nnoremap ,as :Ack<CR>
