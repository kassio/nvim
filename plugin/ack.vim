let g:ack_apply_qmappings = 1
let g:ackhighlight = 1
let g:ackprg = 'ag'
let g:ack_default_options = ' -s -H --smart-case --nogroup --nocolor --column --follow'

let g:ack_mappings = {
      \ "t": "<C-W><CR><C-W>T",
      \ "o": "<CR>",
      \ "<c-s>": "<C-W><CR><C-W>K",
      \ "<c-v>": "<C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t" }


vnoremap ,as :<C-u>exec 'Ack "' . text#escape_all(text#get_visual()) . '"'<CR>
nnoremap ,as :Ack<CR>
