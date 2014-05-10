set laststatus=2
let g:lightline = {}
let g:lightline.active = {
      \   'left': [
      \      [ 'bufnum' ],
      \      [ 'filename', 'modified' ],
      \      [ 'ctrlpmark' ]
      \   ],
      \   'right': [
      \     [ 'lineinfo', 'nerdtree' ],
      \     [ 'fileformat', 'fileencoding', 'filetype' ],
      \     [ 'syntastic' ]
      \   ]
      \ }

let g:lightline.inactive = {
      \   'left': [
      \      [ 'bufnum' ],
      \      [ 'filename', 'modified' ]
      \   ],
      \   'right': [
      \     [ 'fileformat', 'fileencoding', 'filetype' ]
      \   ]
      \ }

let g:lightline.component = {
      \ 'filename': '%{expand("%:t") == "ControlP" ? g:lightline.ctrlp_item : expand("%:p")}',
      \ 'lineinfo': '%c,%l/%L %P'
      \ }

let g:lightline.component_type     = { 'syntastic': 'error' }
let g:lightline.component_function = { 'ctrlpmark': 'CtrlPSTL' }
let g:lightline.component_expand   = {
      \ 'syntastic': 'SyntasticStatuslineFlag',
      \ 'nerdtree': 'NERDTreeSTL'
      \ }

let g:lightline.component_visible_condition = {
      \ 'modified': '&modified'
      \ }

function! CtrlPSTL()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])

    return lightline#concatenate([
          \ g:lightline.ctrlp_prev,
          \ g:lightline.ctrlp_item,
          \ g:lightline.ctrlp_next
          \ ], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
      \ 'main': 'CtrlPStatusMain',
      \ 'prog': 'CtrlPStatusProg'
      \ }

function! CtrlPStatusMain(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev  = a:prev
  let g:lightline.ctrlp_item  = a:item
  let g:lightline.ctrlp_next  = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusProg(str)
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost * call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

function! NERDTreeSTL()
  if &ft == 'nerdtree'
    return "%=%-28{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"
  else
    return ''
  endif
endfunction

let g:lightline.tabline = { 'left': [ [ 'tabs' ] ], 'right': [ [ '' ] ] }
let g:lightline.tab = {
      \ 'active': [ 'tabnum', 'filename' ],
      \ 'inactive': [ 'tabnum', 'filename', 'modified' ]
      \ }
