if exists('b:statusline_setup_loaded')
  finish
endif
let b:statusline_setup_loaded=1

set laststatus=2
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='dark'

let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c', 'gutter' ],
      \ [ 'warning', 'x', 'y', 'z' ]
      \ ]

let g:airline_section_a = "%n"
let g:airline_section_c = "%t%m"
let g:airline_section_z = "%c,%l/%L %P"
let g:airline_section_warning = "%{SyntasticStatuslineFlag()}"
