let g:lightline = {
      \ 'colorscheme': 'PaperColor_dark',
      \ 'active': {
      \   'left': [
      \       [ 'bufnum', 'mode' ],
      \       [ 'modified', 'filename' ],
      \       [ 'ctrlpmark' ]
      \   ],
      \   'right': [
      \       [ 'neomake', 'neoterm_r', 'neoterm_s', 'neoterm_f' ],
      \       [ 'fileformat', 'fileencoding', 'filetype', 'line_count', 'nerdtree' ]
      \   ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'filename' ] ],
      \   'right': [ [ 'nerdtree' ] ]
      \ },
      \ 'component': {
      \   'neomake': '%#StatusWarning#%{statusline#neomake()}%*',
      \   'neoterm_r': '%{neoterm#test#status("running")}%*',
      \   'neoterm_s': '%#StatusSuccess#%{neoterm#test#status("success")}%*',
      \   'neoterm_f': '%#StatusError#%{neoterm#test#status("failed")}%*'
      \ },
      \ 'component_function': {
      \   'bufnum': 'LightLineBufNum',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'line_count': 'LightLineStats',
      \   'mode': 'LightLineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \   'nerdtree': 'NERDTreeStatusline'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'neomake': '(len(statusline#neomake())>0)'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineBufNum()
  return expand('%:t') =~ 'NERD_tree' ? '' : bufnr('%') . ' |'
endfunction

function! LightLineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineStats()
  if expand('%:t') =~ 'NERD_tree'
    return ''
  else
   let curpos = getcurpos()
   return printf('%d,%d/%d', curpos[2], curpos[1], line('$'))
  end
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == 'ControlP' ? 'CtrlP' :
        \ fname =~ 'NERD_tree' ? '' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! NERDTreeStatusline()
  if expand('%:t') =~ 'NERD_tree'
    return lightline#concatenate([strpart(matchstr(getline('.'), '\s\zs\w\(.*\)'), 0, 28)], 0)
  else
    return ''
  end
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([
          \ g:lightline.ctrlp_prev,
          \ g:lightline.ctrlp_item,
          \ g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFuncMain',
  \ 'prog': 'CtrlPStatusFuncProg',
  \ }

function! CtrlPStatusFuncMain(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFuncProg(str)
  return lightline#statusline(0)
endfunction
