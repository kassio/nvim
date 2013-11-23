aug filetype_setup
  au!
  au FileType vim,css,ruby,eruby,tex,c,sh,java,python,js,javascript setlocal
        \ autoindent
        \ copyindent
        \ cindent
        \ smartindent
        \ tabstop=2
        \ expandtab
        \ smarttab
        \ shiftround
  au FileType tex,txt,mail,text,markdown setlocal textwidth=80
  au Filetype gitcommit setlocal textwidth=72
  au FileType tex,txt,mail,text,markdown,gitcommit setlocal
        \ spell
        \ formatoptions+=a
  au BufNewFile,BufReadPost *.md setlocal ft=markdown
aug END
