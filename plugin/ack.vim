" Ack
let g:ackprg="ack -H -i --column --follow"
map ,as :exec ":Ack "expand('<cword>')<CR>
