" Wiki
let potwiki_home=$HOME."/Dropbox/Public/.wiki/HomePage"
let potwiki_autowrite=1
" My default wiki head
function! WikiHead()
  if getfsize(expand('<afile>')) == -1
    normal gg
    call append(0, "# Potwiki - Kássio Borges")
    call append(1, "# Home: HomePage")
    call append(2, "# Wiki: " . expand("%:t"))
    call append(3, "#================================================")
    call append(4, "")
    normal G
  endif
endfunction

" Input head on wiki files
au BufNew,FileType potwiki call WikiHead()
