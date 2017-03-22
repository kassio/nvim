nnoremap <leader>ss :silent! mksession! ._v-session<cr>:echo 'Session saved!'<cr>
nnoremap <leader>sl :silent! source ._v-session<cr>:echo 'Session loaded!'<cr>
nnoremap <leader>sd :silent! exec '!rm ._v-session &>/dev/null'<cr>:echo 'Session deleted'<cr>
