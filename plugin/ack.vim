let g:ackhighlight = 1
let g:ack_autoclose = 1
let g:ackprg = "ag"
let g:ack_default_options = "-U --silent --follow --column --smart-case"
let g:ack_mappings = {
      \ "o": "<CR>",
      \ "<c-t>": "<C-W><CR><C-W>T",
      \ "<c-h>": "<C-W><CR><C-W>K",
      \ "<c-v>": "<C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t" }

vnoremap ,as :<C-u>exec 'Ack "' . text#escape_all(text#get_visual()) . '"'<CR>
nnoremap ,as :Ack<CR>
