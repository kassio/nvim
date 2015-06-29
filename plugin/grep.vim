let &grepformat='%f:%l:%c:%m,%f:%l:%m'  " Include column number
let &grepprg="ag -U --silent --follow --column --smart-case"

vnoremap ,as :<c-u>exec 'silent! lgrep "' . text#escape_all(text#get_visual()) . '"' \| lopen<cr>
nnoremap ,as :exec 'silent! lgrep ' . expand('<cword>') \| lopen<cr>
