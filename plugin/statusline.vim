set laststatus=2
set statusline=
set statusline+=[%n]
set statusline+=%t%m
set statusline+=%=
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%r%y
set statusline+=[%{&ff}]
set statusline+=[%{&fenc!=''?&fenc:&enc}]
set statusline+=[%c,%l/%L\ %P]
