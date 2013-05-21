"let g:quickfixsigns_classes=['vcsdiff', 'marks']
let g:quickfixsigns_events=[
      \ 'BufEnter',
      \ 'CursorHold',
      \ 'CursorHoldI',
      \ 'CursorMoved',
      \ 'CursorMovedI',
      \ 'InsertChange',
      \ 'InsertEnter',
      \ 'InsertLeave',
      \ 'QuickFixCmdPost'
      \ ]

let g:quickfixsigns_class_vcsdiff['event']=g:quickfixsigns_events
let g:quickfixsigns_class_marks['event']=g:quickfixsigns_events
