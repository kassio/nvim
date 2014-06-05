let g:UltiSnipsSnippetDirectories=['snips']

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

inoremap <TAB> <C-R>=SnippetOrCloserGetOut()<CR>
let g:ulti_expand_or_jump_res = 0
function! SnippetOrCloserGetOut()
  call UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res
    return ""
  elseif len(g:closer_stack)
    return closer#get_out() . "\<right>"
  else
    return "\<tab>"
  endif
endfunction
