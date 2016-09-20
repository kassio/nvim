let s:block_start = '\(\<do\>\|\<fn\>\)'
let s:block_end = '\<en\zsd\>'
function! textobj#elixir#block_a()
  call searchpair(s:block_start, '', s:block_end)
  let end_pos = getpos('.')
  normal %
  let start_pos = getpos('.')

  return ['v', start_pos, end_pos]
endfunction

function! textobj#elixir#block_i()
  call searchpair(s:block_start, '', s:block_end)
  let [bufnum, lnum, col, off] = getpos('.')
  let end_pos = [bufnum, lnum-1, col, off]
  normal %
  let [bufnum, lnum, col, off] = getpos('.')
  let start_pos = [bufnum, lnum+1, col, off]

  return ['V', start_pos, end_pos]
endfunction

let s:function_start = '^\s*defp\?\>.*do\s*$'
let s:function_end = s:block_end
function! textobj#elixir#function_a()
  call searchpair(s:function_start, '', s:function_end, 'b')
  let start_pos = getpos('.')
  normal %
  let end_pos = getpos('.')

  return ['V', start_pos, end_pos]
endfunction

function! textobj#elixir#function_i()
  call searchpair(s:function_start, '', s:function_end, 'b')
  let [bufnum, lnum, col, off] = getpos('.')
  let start_pos = [bufnum, lnum+1, col, off]
  normal %
  let [bufnum, lnum, col, off] = getpos('.')
  let end_pos = [bufnum, lnum-1, col, off]

  return ['V', start_pos, end_pos]
endfunction

let s:module_start = '^\s*defmodule\>.*do\s*$'
let s:module_end = s:block_end
function! textobj#elixir#module_a()
  call searchpair(s:module_start, '', s:module_end, 'b')
  let start_pos = getpos('.')
  normal %
  let end_pos = getpos('.')

  return ['V', start_pos, end_pos]
endfunction

function! textobj#elixir#module_i()
  call searchpair(s:module_start, '', s:module_end, 'b')
  let [bufnum, lnum, col, off] = getpos('.')
  let start_pos = [bufnum, lnum+1, col, off]
  normal %
  let [bufnum, lnum, col, off] = getpos('.')
  let end_pos = [bufnum, lnum-1, col, off]

  return ['V', start_pos, end_pos]
endfunction
