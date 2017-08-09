scriptencoding = 'utf8'
let g:signify_sign_add               = '│'
let g:signify_sign_delete            = '│'
let g:signify_sign_delete_first_line = '│'
let g:signify_sign_change            = '│'
let g:signify_sign_changedelete      = '│'

let g:signify_vcs_list = ['git']

let g:signify_disable_by_default = 0
let g:signify_update_on_bufenter = 1
let g:signify_update_on_focusgained = 1
let g:signify_sign_show_count = 0

nmap <leader>sn :call GoToNextSign()<cr>
nmap <leader>sN :call GoToPreviousSign()<cr>

omap is <plug>(signify-motion-inner-pending)
xmap is <plug>(signify-motion-inner-visual)
omap as <plug>(signify-motion-outer-pending)
xmap as <plug>(signify-motion-outer-visual)

function! CurrentSigns()
  redir => l:signs
  silent exec printf('sign place buffer=%s', bufnr('.'))
  redir END

  let l:values = map(split(l:signs, '\n'), function('MapSign'))
  let l:values = filter(copy(l:values), { _, value -> type(value) == type({}) })
  let l:values = sort(copy(l:values), { a, b -> a.ine == b.line ? 0 : a.line > b.line ? 1 : -1 })
  return l:values
endfunction

function! MapSign(index, line)
  let l:values = matchlist(a:line, 'line=\(\d\+\)\s*id=\(\d\+\)\s*name=\(\w\+\)')
  if !empty(l:values)
    return { 'line': l:values[1], 'id': l:values[2], 'name': l:values[3] }
  end
endfunction

function! NextSign()
  let l:line = line('.')
  let l:signs = CurrentSigns()

  for l:sign in l:signs
    if l:sign.line > l:line
      let l:result = l:sign
      break
    end
  endfor

  if exists('l:result')
    return l:result
  end
endfunction

function! PreviousSign()
  let l:line = line('.')
  let l:signs = CurrentSigns()

  for l:sign in reverse(l:signs)
    if l:sign.line < l:line
      let l:result = l:sign
      break
    end
  endfor

  if exists('l:result')
    return l:result
  end
endfunction

function! GoToNextSign()
  let l:sign = NextSign()

  if type(l:sign) != type({})
    let l:sign = CurrentSigns()[0]
  end

  let l:pos = getpos('.')
  let l:pos[1] = l:sign.line

  call setpos('.', pos)
endfunction

function! GoToPreviousSign()
  let l:sign = PreviousSign()

  if type(l:sign) != type({})
    let l:sign = CurrentSigns()[-1]
  end

  let l:pos = getpos('.')
  let l:pos[1] = l:sign.line

  call setpos('.', pos)
endfunction
