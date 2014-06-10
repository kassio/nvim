set statusline=
set statusline+=[%n]
set statusline+=%t%m
set statusline+=%=
set statusline+=%{match_counter#stl()}
set statusline+=%1*%{SyntasticStatuslineFlag()}%*
set statusline+=%r%y
set statusline+=[%{&ff}]
set statusline+=[%{&fenc!=''?&fenc:&enc}]
set statusline+=[%c,%l/%L\ %P]
set laststatus=2
