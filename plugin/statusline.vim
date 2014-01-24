set statusline=
set statusline+=[%n]
set statusline+=\ %<%F
set statusline+=\ %y%r%m
set statusline+=\ %{&fenc!=''?&fenc:&enc}
set statusline+=\ %{&ff}
set statusline+=\ %#errormsg#%{GitEmailAlert()}%*
set statusline+=\ %#StatusLineNC#%{SyntasticStatuslineFlag()}%*
set statusline+=%=[%c,%l]\ %L
set laststatus=2
