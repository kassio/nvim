let g:session_dir = expand('$HOME/.local/share/nvim/session')
let g:session_file_prefix = trim(system('git symbolic-ref --short HEAD'))

nnoremap <silent> <leader>ss :call session#save()<cr>
nnoremap <silent> <leader>sl :call session#load()<cr>
nnoremap <silent> <leader>sd :call session#destroy()<cr>

command! SessionDestroyAll call session#destroy_all()
command! SessionDestroy call session#destroy()
command! SessionSave call session#save()
command! SessionLoad call session#load()
command! SessionList echo session#list()
