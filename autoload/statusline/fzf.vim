function! statusline#fzf#()
  let l:fzf_cmd_name = toupper(get(b:fzf, 'name', 'FZF'))
  let &l:statusline = '> '.l:fzf_cmd_name
endfunction
