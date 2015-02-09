aug text_files_setup
  au!
  au FileType tex,txt,mail,text,gitcommit setlocal
        \ spell
        \ formatoptions+=a

  au FileType tex,txt,mail,text,markdown setlocal
        \ textwidth=80
        \ noautoindent
        \ nocindent

  au FileType gitcommit setlocal
        \ textwidth=72

  au BufNewFile,BufReadPost,BufWritePre,FileWritePre *.md setlocal
        \ ft=markdown
aug END
