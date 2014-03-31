if exists('b:retag_setup_loaded')
  finish
endif
let b:retag_setup_loaded=1

aug retag
  au!
  au FileType vim,css,ruby,eruby,tex,c,sh,java,python,js,javascript,elixir
        \ if !filewritable('tags') |
        \   echo "No, writable, tags file founded" |
        \ endif
  au BufWritePre,FilterWritePre *
        \ if filewritable('tags') |
        \   call system('ctags &>/dev/null &') |
        \ endif
aug END
