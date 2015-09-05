let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'bufnum' ], [ 'modified', 'filename' ] ],
      \   'right': [
      \       [ 'neomake', 'neoterm_r', 'neoterm_s', 'neoterm_f' ],
      \       [ 'fileformat', 'fileencoding', 'filetype', 'line_count' ]
      \   ]
      \ },
      \ 'component': {
      \   'bufnum': '%n',
      \   'line_count': '%c,%l/%L',
      \   'neomake': '%#StatusWarning#%{statusline#neomake()}%*',
      \   'neoterm_r': '%{neoterm#test#status("running")}%*',
      \   'neoterm_s': '%#StatusSuccess#%{neoterm#test#status("success")}%*',
      \   'neoterm_f': '%#StatusError#%{neoterm#test#status("failed")}%*'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'neomake': '(len(statusline#neomake())>0)'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
