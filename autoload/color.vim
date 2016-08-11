function! color#current()
  let current_names = map(s:currentStack(), 's:colorNamesFor(v:val)')

  return join(current_names, ', ')
endfunction

function! s:colorNamesFor(val)
  return uniq([synIDattr(a:val, "name"), synIDattr(synIDtrans(a:val), "name")])
endfunction

function! s:currentStack()
  return synstack(line("."), col("."))
endfunction

function! color#dark()
  hi clear
  syntax reset
  set background=dark
  colorscheme base16-oceanicnext

  call s:hi('StatusLine',     'eeeeee', '3e5570', '', '')
  call s:hi('StatusLineNC',   '888888', '515966', '', '')

  call s:hi('SLModeNormal',   'cccccc', '5a87ad', '', '')
  call s:hi('SLModeInsert',   '595959', 'badb51', '', '')
  call s:hi('SLModeVisual',   'eeeeee', 'cd9cce', '', '')
  call s:hi('SLUnsavedFile',  'eeeeee', 'cc4a21', '', '')
  call s:hi('SLModeTerminal', '595959', 'eeeeee', '', '')

  call s:default_colors()
endfunction

function! color#light()
  hi clear
  syntax reset
  set background=light
  colorscheme base16-solarized-light

  call s:hi('StatusLine',     '666666', 'cdc6b4', '', '')
  call s:hi('StatusLineNC',   '999999', 'ddd6c4', '', '')

  call s:hi('SLModeNormal',   '666666', 'bbbbbb', '', '')
  call s:hi('SLModeInsert',   '595959', 'badb51', '', '')
  call s:hi('SLModeVisual',   'eeeeee', 'cd9cce', '', '')
  call s:hi('SLUnsavedFile',  'eeeeee', 'cc4a21', '', '')
  call s:hi('SLModeTerminal', '595959', 'eeeeee', '', '')

  call s:default_colors()
endfunction

function! s:default_colors()
  hi! VertSplit guibg=NONE

  hi! StatusWarning  guifg=#65737e guibg=#fac863
  hi! StatusSuccess  guifg=#cccccc guibg=#5b903f
  hi! StatusError    guifg=#ee6060 guibg=#b01010

  hi! link TabLine     StatusLine
  hi! link TabLineFill StatusLine
  hi! link TabLineSel  SLModeNormal
endfunction

" Highlighting function
function! s:hi(group, guifg, guibg, attr, guisp)
  if a:guifg != ""
    exec "hi! " . a:group . " guifg=#" . a:guifg
  endif
  if a:guibg != ""
    exec "hi! " . a:group . " guibg=#" . a:guibg
  endif
  if a:attr != ""
    exec "hi! " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if a:guisp != ""
    exec "hi! " . a:group . " guisp=#" . a:guisp
  endif
endfunction
