let g:unite_data_directory = expand('~/.vim_data/unite')
let g:unite_source_rec_async_command = 'ack -f --nofilter'

call unite#custom#source('line,buffer,file_mru,file_rec/async', 'sorters', 'sorter_rank')
call unite#custom#source('line,buffer,file_mru,file_rec/async', 'matchers', 'matcher_fuzzy')

nnoremap <silent><C-p> :<C-u>Unite -start-insert file_rec/async<CR>
nnoremap <silent><C-m> :<C-u>Unite -start-insert file_mru<CR>
nnoremap <silent><C-n> :<C-u>Unite -start-insert line<CR>

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  imap <C-j> <nop>
  inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  inoremap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  nmap <silent><buffer> <ESC> <Plug>(unite_exit)
endfunction

aug unite_cache_dir
  au!
  au VimEnter *
        \ if !isdirectory(g:unite_data_directory) |
        \   call mkdir(expand(g:unite_data_directory), "p", 0700) |
        \ endif
aug END
