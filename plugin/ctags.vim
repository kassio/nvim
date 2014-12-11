aug ctags
  au!
  au FileWritePost,BufWritePost
        \ *.vim
        \ *.rb
        \ *.js
        \ *.jsx
        \ *.ex
        \ *.exs
        \ *.css
        \ *.scss
        \ silent call system('ctags-once &')
aug END
