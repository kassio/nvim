let g:ack_apply_qmappings = 1
let g:ackhighlight = 1
let g:ackprg = 'ack -s -H --smart-case --nogroup --nocolor --column --follow'

let g:ack_mappings = {
      \ "t": "<C-W><CR>zz<C-W>T",
      \ "T": "<C-W><CR>zz<C-W>TgT<C-W>j",
      \ "o": "<CR>zz",
      \ "O": "<CR>zz<C-W><C-W>:ccl<CR>zz",
      \ "go": "<CR>zz<C-W>j",
      \ "h": "<C-W><CR>zz<C-W>K",
      \ "H": "<C-W><CR>zz<C-W>K<C-W>b",
      \ "v": "<C-W><CR>zz<C-W>H<C-W>b<C-W>J<C-W>t",
      \ "gv": "<C-W><CR>zz<C-W>H<C-W>b<C-W>J" }

vnoremap ,as :<C-u>exec 'Ack "' . text#escape_all(text#get_visual()) . '"'<CR>
nnoremap ,as :Ack<CR>
