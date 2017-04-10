cabbrev Git G
cabbrev Gwrite Gw
cabbrev Gd Gdiff
command! -nargs=* Gco call git#checkout(<q-args>)
command! Ghome call system('git home')
command! Gwork call system('git work')
