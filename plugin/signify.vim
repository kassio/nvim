let g:signify_mapping_next_hunk = '<leader>sn'
let g:signify_mapping_prev_hunk = '<leader>sp'

aug signify_refresh
  au!
  au FocusGained * SignifyRefresh
aug END
