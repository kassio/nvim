nnoremap <leader>ss :silent! mksession! .vsession \| echo 'Session saved!'<cr>
nnoremap <leader>sl :silent! source .vsession \| echo 'Session loaded!'<cr>
nnoremap <leader>sd :silent! exec '!rm .vsession &>/dev/null'<cr>:echo 'Session deleted'<cr>
