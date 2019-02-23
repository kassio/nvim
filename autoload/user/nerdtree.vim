function! user#nerdtree#mirror_toggle() abort
  try
    if s:tab_has_nerdtree() > 0
      NERDTreeToggle
    else
      call s:mirror_or_create()
    end
  catch
    redraw!
    NERDTree
    call NERDTreeRender()
  endtry
endfunction

function! user#nerdtree#mirror_find() abort
  let l:current_window = winnr()
  call s:mirror_or_create()
  exec l:current_window . 'wincmd w'

  NERDTreeRefreshRoot
  NERDTreeFind
endfunction

function! s:mirror_or_create() abort
  silent NERDTreeMirror

  if s:nerdtree_current_buffer() > 0
    if s:tab_has_nerdtree() > 0
      silent NERDTreeFocus
    else
      silent NERDTreeToggle
    end
  else
    silent NERDTree
    call s:globalize_nerdtree_buffer()
  end
endfunction

function! s:nerdtree_current_buffer() abort
  if !exists('g:nerdtree_current_buffer')
    call s:globalize_nerdtree_buffer()
  end

  return get(g:, 'nerdtree_current_buffer', -1)
endfunction

function! s:tab_has_nerdtree() abort
  if s:nerdtree_current_buffer() > 0
    let l:tab_buffers = filter(tabpagebuflist(), { _, bufid -> bufid == s:nerdtree_current_buffer() })
    return !empty(l:tab_buffers)
  else
    return -1
  end
endfunction

function! s:globalize_nerdtree_buffer() abort
  let l:all_buffers = range(1, bufnr('$'))
  let l:nerdtree_buffers = filter(l:all_buffers, 'bufname(v:val) =~ "NERD_tree_\\d\\+"')
  if !empty(l:nerdtree_buffers)
    let g:nerdtree_current_buffer = l:nerdtree_buffers[0]
  end
endfunction
