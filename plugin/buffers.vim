command! -nargs=1 NO
      \ execute "new \| b " . <q-args>

command! -nargs=1 TO
      \ execute "tabnew \| b " . <q-args>

command! -nargs=1 VO
      \ execute "vnew \| b " . <q-args>
