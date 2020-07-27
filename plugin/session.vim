let g:session_dir = expand('$HOME/.local/share/nvim/session')

nnoremap <silent> <leader>ss :call session#save()<cr>
nnoremap <silent> <leader>sl :call session#load()<cr>
nnoremap <silent> <leader>sd :call session#destroy()<cr>

command! SessionDestroyAll call session#destroy_all()
command! SessionDestroy call session#destroy()
command! -nargs=? SessionSave call session#save({ 'prefix': <q-args> })
command! SessionLoad call session#load()
command! SessionList echo join(session#list(), "\n")
