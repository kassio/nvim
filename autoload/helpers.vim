
function! helpers#sum(value)
  if !exists('g:sum')
    let g:sum = 0  "result in global variable S
  end

  let g:sum = g:sum + a:value

  return a:value
endfunction

function! helpers#sum_reset()
  let g:sum = 0
endfunction

function! helpers#sum_all_lines()
  call helpers#sum_reset()
  execute '%s/^.*$/\=helpers#sum(submatch(0))/n'
  echo 'Result: ' . g:sum
endfunction
