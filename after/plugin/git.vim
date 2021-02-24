command! -nargs=* Grt call git#restore(<q-args>)
command! Gremote call git#remote()
command! GremoteMaster call git#remote_master()
command! GremoteCommit call git#remote_commit()
command! Gblame :Git blame

cabbrev Gw Gwrite
cabbrev Gd Gdiffsplit
cabbrev Gr Gremote
