let g:lightline = {
      \ 'colorscheme': 'PaperColor_dark',
      \ 'active': {
      \   'left': [
      \       [ 'bufnum', 'mode' ],
      \       [ 'modified', 'filename' ],
      \       [ 'ctrlp' ]
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
      \   'bufnum': 'statusline#bufnum',
      \   'filename': 'statusline#filename',
      \   'fileformat': 'statusline#fileformat',
      \   'filetype': 'statusline#filetype',
      \   'fileencoding': 'statusline#fileencoding',
      \   'line_count': 'statusline#stats',
      \   'mode': 'statusline#mode',
      \   'ctrlp': 'statusline#ctrlp',
      \   'nerdtree': 'statusline#nerdtree'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'neomake': '(len(statusline#neomake())>0)'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

let g:ctrlp_status_func = {
  \ 'main': 'statusline#ctrlp_main',
  \ 'prog': 'statusline#ctrlp_prog',
  \ }
