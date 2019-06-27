command! -nargs=* Gco call git#checkout(<q-args>)
command! Gopen call git#open_url()

cabbrev Gw Gwrite
cabbrev Gd Gdiff
cabbrev Go Gopen
