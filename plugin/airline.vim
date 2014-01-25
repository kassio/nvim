let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='dark'

let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c', 'git_user' ],
      \ [  'gutter', 'syntastic', 'z' ]
      \ ]

let g:airline_section_a         = "%n"
let g:airline_section_b         = "%<%F%m"
let g:airline_section_c         = "%y%r %{&fenc!=''?&fenc:&enc}"
let g:airline_section_git_user  = "%#errormsg#%{GitEmailAlert()}"
let g:airline_section_gutter    = "%="
let g:airline_section_syntastic = "%#errormsg#%{SyntasticStatuslineFlag()}"
let g:airline_section_z         = "%c,%l/%L"
