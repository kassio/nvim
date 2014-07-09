let g:unite_data_directory = expand('~/.vim_data/unite')

call unite#custom#source('line,buffer,file_mru,file_rec', 'sorters', 'sorter_rank')
call unite#custom#source('line,buffer,file_mru,file_rec', 'matchers', 'matcher_fuzzy')

nnoremap ,nr :<C-u>Unite -start-insert file_rec:./<CR>
nnoremap ,nm :<C-u>Unite -start-insert file_mru<CR>
nnoremap ,nb :<C-u>Unite -start-insert buffer<CR>
nnoremap ,nl :<C-u>Unite -start-insert line<CR>

" Temporary
nnoremap <C-p> :<C-u>Unite -start-insert file_rec:./<CR>

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  imap <silent><buffer><expr> <C-s> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
endfunction

aug unite_cache_dir
  au!
  au VimEnter *
        \ if !isdirectory(g:unite_data_directory) |
        \   call mkdir(expand(g:unite_data_directory), "p", 0700) |
        \ endif
aug END
