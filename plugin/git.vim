command! -nargs=* Grt call git#restore(<q-args>)
command! Gremote call git#remote()

cabbrev Gw Gwrite
cabbrev Gd Gdiff
cabbrev Gh Gremote
