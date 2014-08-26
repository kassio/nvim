function! personal#unite#settings()
  inoremap <silent><buffer><C-j> <nop>
  inoremap <silent><buffer><C-k> <nop>

  inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  inoremap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
  nmap <silent><buffer><expr> <C-s> unite#do_action('split')
  nmap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  nmap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  nmap <silent><buffer> <ESC> <Plug>(unite_exit)
  imap <silent><buffer> <ESC> <Plug>(unite_exit)
endfunction

function! personal#unite#my_action(cmd)
  let my_action = {
        \ 'is_selectable' : 1,
        \ 'cmd': a:cmd
        \ }

  function! my_action.func(candidates)
    let l:bname = expand(a:candidates[0].action__path)

    if bufexists(l:bname)
      execute 'silent sbuffer ' . l:bname
    else
      execute 'silent badd ' . l:bname
      execute 'silent ' . self.cmd . ' ' . l:bname
    end
  endfunction

  return my_action
endfunction
