call unite#custom#source('line', 'matchers', 'matcher_fuzzy')
call unite#filters#matcher_default#use(['matcher_fuzzy'])

nmap <F5> <Plug>(unite_redraw)

nnoremap <c-p> :<C-u>Unite -start-insert file_rec:./<CR>
nnoremap <c-m> :<C-u>Unite -start-insert file_mru<CR>
nnoremap <c-n> :<C-u>Unite -start-insert line<CR>

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)

  imap <silent><buffer><expr> <C-s> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  nmap <silent><buffer> <F5> <Plug>(unite_redraw)
  imap <silent><buffer> <F5> <Plug>(unite_redraw)

  imap <silent><buffer> <c-p> <Plug>(unite_exit)
  nmap <silent><buffer> <c-p> <Plug>(unite_exit)
endfunction
