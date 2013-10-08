if !exists('TmuxRunner')
  let TmuxRunner = { 'frameworks': {}, 'framework': '' }
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
    call self.selectFramework()
  endif

  let thisFile = expand('%:p')

  if a:full != 'all' && !self.framework.validate(thisFile)
    echo 'Not a test file'
    return
  endif

  let g:lastTmuxCmd = self.framework.run(thisFile, a:full) . "\n"

  call SendKeysToTmux('C-c C-l')
  call SendToTmux(g:lastTmuxCmd)
endfunction

function! TmuxRunner.selectFramework()
  if len(g:tmuxRunnerFrameworks) == 1
    return g:tmuxRunnerFrameworks[0]
  endif

  let selected = input('Choose a runner: ', '', 'customlist,FrameworksCompletion')
  let self.framework = self.frameworks[selected]
endfunction

function! FrameworksCompletion(A, L, P)
  let frameworks = copy(g:tmuxRunnerFrameworks)
  return filter(frameworks, 'v:val =~ "' . a:A . '"')
endfunction

nmap <leader>ct :call TmuxRunner.selectFramework()<CR>
nmap <leader>rt :call TmuxRunner.Run('all')<CR>
nmap <leader>rf :call TmuxRunner.Run('file')<CR>
nmap <leader>rl :call TmuxRunner.Run('current')<CR>
nmap <leader>rr :call SendKeysToTmux('C-c C-l')<CR>
      \ :call SendToTmux(g:lastTmuxCmd)<CR>
