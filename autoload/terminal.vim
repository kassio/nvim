" Public: Executes a command on terminal. Evaluates any "%" inside the command
" to the full path of the current file.
function! terminal#do(command)
  let command = substitute(a:command, '%', expand('%:p'), 'g')

  call <sid>term_exec([command, ''])
endfunction

" Internal: Loads a terminal, if it is not loaded, and execute a list of
" commands.
function! s:term_exec(list)
  if !exists('g:term_current_id')
    let current_window = winnr()
    if g:term_position == 'horizontal'
      exec "botright new | term" | exec current_window . "wincmd w | set noim"
    else
      exec "botright vert new | term" | exec current_window . "wincmd w | set noim"
    end
  end

  call jobsend(g:term_current_id, a:list)
endfunction

" Internal: Loads a REPL, if it is not loaded, and execute the given list of
" commands. The REPL public API are the commands REPLSendLine and
" REPLSendSelection.
function! terminal#repl(command)
  if exists('g:term_repl_command') && !exists('g:term_repl_loaded')
    call terminal#do(g:term_repl_command)
    let g:term_repl_loaded = 1
  end

  call <sid>term_exec(add(a:command, ''))
endfunction

function! terminal#test_runner(scope)
  let Fn = function('terminal#' . g:term_test_lib)
  let g:term_last_test_command = Fn(a:scope)

  call terminal#do(g:term_last_test_command)
endfunction

function! terminal#rspec(scope)
  let command = 'rspec'

  if a:scope == 'file'
    let command .= ' ' . expand('%:p')
  elseif a:scope == 'current'
    let command .= ' ' . expand('%:p') . ':' . line('.')
  endif

  return "clear; " . command
endfunction

function! terminal#minitest(scope)
  if a:scope == 'all'
    let command = 'rake test'
  elseif a:scope == 'file'
    let command = 'ruby -Ilib:test ' . expand('%:p')
  elseif a:scope == 'current'
    let command = 'ruby -Ilib:test ' . expand('%:p') . ' -n /' . <sid>get_current_minitest() . '/'
  endif

  return command
endfunction

function! s:get_current_minitest()
  let nearest_test = search("def\ test_", "nb")

  if nearest_test != 0
    return matchstr(getline(nearest_test), "test_.*")
  else
    let nearest_test = search("\\(test\\|it\\)\\s", 'nb')

    if nearest_test
      let test_string = split(getline(nearest_test), '["'']')[1]
      let test_string = escape(test_string, '#')

      return substitute(tolower(test_string), ' ', '_', 'g')
    endif
  endif
endfunction
