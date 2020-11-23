command! -nargs=* Grt call git#restore(<q-args>)
command! Gremote call git#remote()
command! GremoteMaster call git#remote_master()
command! GremoteCommit call git#remote_commit()

cabbrev Gw Gwrite
cabbrev Gd Gdiff
cabbrev Gr Gremote
cabbrev Grm GremoteMaster
cabbrev Grc GremoteCommit
