scriptencoding = 'utf8'
let g:signify_sign_add               = '┃'
let g:signify_sign_delete            = '┃'
let g:signify_sign_delete_first_line = '┃'
let g:signify_sign_change            = '┃'
let g:signify_sign_changedelete      = '┃'

let g:signify_vcs_list = ['git']

let g:signify_disable_by_default = 0
let g:signify_update_on_bufenter = 1
let g:signify_update_on_focusgained = 1
let g:signify_sign_show_count = 0

omap is <plug>(signify-motion-inner-pending)
xmap is <plug>(signify-motion-inner-visual)
omap as <plug>(signify-motion-outer-pending)
xmap as <plug>(signify-motion-outer-visual)

" Signify
nnoremap <leader>gn <plug>(signify-next-hunk)
nnoremap <leader>gp <plug>(signify-prev-hunk)
