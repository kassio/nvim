function! user#fzf#window()
  let buf = nvim_create_buf(v:false, v:true)

  let height = float2nr(&lines * 0.8)
  let width = &columns - 20
  let horizontal = 10
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_buf_set_keymap(buf, '', '<esc>', ':close!<cr>', {'nowait': v:true})
  call nvim_set_current_win(nvim_open_win(buf, v:true, opts))

  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction
