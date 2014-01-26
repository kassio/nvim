set statusline=
set statusline+=%2n
set statusline+=\ %<%F%m
set statusline+=\ %r%y
set statusline+=[%{&ff}][%{&fenc!=''?&fenc:&enc}]
set statusline+=%#errormsg#%{GitEmailAlert()}%*
set statusline+=%=
set statusline+=%#errormsg#%{SyntasticStatuslineFlag()}%*
set statusline+=[%c,%l/%L]
set laststatus=2
