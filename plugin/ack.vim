" Ack
let g:ackprg="ack -H -i --column --follow"
map ,as :exec ":Ack "expand('<cword>')<CR>

function! VSetSearch()
  let temp = @s
  norm! gv"sy
  return ':Ack "' . substitute(escape(@s, '\'), '\n', '\\n', 'g') . '"'
endfunction

vmap ,asv :<C-u>exec VSetSearch()<CR>
