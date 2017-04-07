let g:signify_disable_by_default = 0
let g:signify_cursorhold_insert = 1
let g:signify_cursorhold_normal = 1
let g:signify_update_on_bufenter = 1
let g:signify_update_on_focusgained = 1

nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sN <plug>(signify-prev-hunk)

omap is <plug>(signify-motion-inner-pending)
xmap is <plug>(signify-motion-inner-visual)
omap as <plug>(signify-motion-outer-pending)
xmap as <plug>(signify-motion-outer-visual)
