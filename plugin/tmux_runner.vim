if !exists('TmuxRunner')
  let TmuxRunner = { "frameworks": {}, "framework": "" }
endif

function! TmuxRunner.register(framework)
  let self.frameworks[a:framework.name] = a:framework

  let g:tmuxRunnerFrameworks =  keys(self.frameworks)
endfunction

function! TmuxRunner.Run(full)
  if !exists('g:tmuxRunnerFrameworks')
    echo 'No TmuxRunner framework registred'
    return
  endif

  if empty(self.framework)
    let self.framework = self.frameworks[self.selectFramework()]
  endif

  let thisFile = expand("%")

  if a:full != 'all' && !self.framework.validate(thisFile)
    echo 'Not a test file'
    return
  endif

  let g:lastTmuxCmd = self.framework.run(thisFile, a:full) . "\n"

  call SendKeysToTmux('C-c C-l')
  call SendToTmux(g:lastTmuxCmd)
endfunction

function! TmuxRunner.selectFramework()
  return input("Choose a runner: ", "", "customlist,FrameworksCompletion")
endfunction

function! FrameworksCompletion(A, L, P)
  return g:tmuxRunnerFrameworks
endfunction

nmap <leader>rt :call TmuxRunner.Run('all')<CR>
nmap <leader>rf :call TmuxRunner.Run('file')<CR>
nmap <leader>rl :call TmuxRunner.Run('current')<CR>
nmap <leader>rr :call SendKeysToTmux('C-c C-l')<CR>
      \ :call SendToTmux(g:lastTmuxCmd)<CR>
