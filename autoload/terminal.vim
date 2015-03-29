function! terminal#rspec(scope)
  let command = 'rspec'

  if a:scope == 'file'
    let command .= ' ' . expand('%:p')
  elseif a:scope == 'current'
    let command .= ' ' . expand('%:p') . ':' . line('.')
  endif

  return command
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
