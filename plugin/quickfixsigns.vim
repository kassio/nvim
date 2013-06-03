let g:quickfixsigns_classes=['loc', 'vcsdiff']
let g:quickfixsigns_events=[
      \ 'BufEnter',
      \ 'CursorHold',
      \ 'CursorMoved',
      \ 'InsertChange',
      \ 'InsertEnter',
      \ 'InsertLeave',
      \ 'QuickFixCmdPost'
      \ ]

let g:quickfixsigns_class_qfl['event']=g:quickfixsigns_events
let g:quickfixsigns_class_loc['event']=g:quickfixsigns_events
let g:quickfixsigns_class_marks['event']=g:quickfixsigns_events
let g:quickfixsigns_class_vcsdiff['event']=g:quickfixsigns_events
