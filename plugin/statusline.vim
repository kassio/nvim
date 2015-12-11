set statusline=
set statusline+=[%{statusline#mode()}]
set statusline+=[%n]
set statusline+=\ %m%f
set statusline+=%=
set statusline+=%#StatusWarning#%{statusline#neomake('W')}%*
set statusline+=%#StatusError#%{statusline#neomake('E')}%*
set statusline+=%#NeotermTestRunning#%{neoterm#test#status('running')}%*
set statusline+=%#NeotermTestSuccess#%{neoterm#test#status('success')}%*
set statusline+=%#NeotermTestFailed#%{neoterm#test#status('failed')}%*
set statusline+=%r%y
set statusline+=[%{&ff}]
set statusline+=[%{&fenc!=''?&fenc:&enc}]
set statusline+=[%c,%l/%L]
