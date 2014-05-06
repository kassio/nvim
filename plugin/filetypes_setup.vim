aug filetype_setup
  au!
  au FileType vim,css,ruby,eruby,tex,c,sh,java,python,js,javascript setlocal
        \ autoindent
        \ copyindent
        \ cindent
        \ smartindent
        \ tabstop=2
        \ shiftwidth=2
        \ softtabstop=2
        \ expandtab
        \ smarttab
        \ shiftround

  au FileType tex,txt,mail,text,markdown setlocal
        \ textwidth=80

  au FileType gitcommit setlocal
        \ textwidth=72

  au FileType tex,txt,mail,text,markdown,gitcommit setlocal
        \ spell
        \ formatoptions+=a

  au BufNewFile,BufReadPost,BufWritePre,FileWritePre *.md setlocal
        \ ft=markdown

  au FileType html,javascript,css,erb,sass,scss setlocal
        \ iskeyword+=-
aug END
