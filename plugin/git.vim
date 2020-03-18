command! -nargs=* Grt call git#restore(<q-args>)
command! -nargs=? Gremote call git#remote(<q-args>)

cabbrev Gw Gwrite
cabbrev Gd Gdiff
cabbrev Gr Gremote
