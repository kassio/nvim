let g:aghighlight = 1
let g:agprg="ag -U --silent --follow --column --smart-case"

vnoremap ,as :<C-u>exec 'Ag "' . text#escape_all(text#get_visual()) . '"'<CR>
nnoremap ,as :Ag<CR>
