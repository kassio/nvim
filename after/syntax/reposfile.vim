if exists('b:current_syntax')
  finish
endif

syn match ReposRemote /^\%(.*\)\ze|/
syn match ReposDivisor /|/
syn match ReposPath /\(|\)\@<=\%(.*\)$/

hi def link ReposRemote Type
hi def link ReposDivisor Number
hi def link ReposPath Special

let b:current_syntax = 'Reposfile'
