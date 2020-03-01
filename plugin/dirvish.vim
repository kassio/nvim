scriptencoding utf-8

nnoremap <leader>p :Dirvish<cr>
nnoremap <leader>vp :vnew +Dirvish<cr>
nnoremap <leader>fl :execute "Dirvish ".expand('%:p')<cr>

let s:file_icons = {
      \ '.gitconfig': '',
      \ '.gitignore': '',
      \ 'sass': '',
      \ 'scss': '',
      \ 'htm': '',
      \ 'html': '',
      \ 'haml': '',
      \ 'slim': '',
      \ 'ejs': '',
      \ 'css': '',
      \ 'less': '',
      \ 'md': '',
      \ 'mdx': '',
      \ 'markdown': '',
      \ 'rmd': '',
      \ 'json': '',
      \ 'js': '',
      \ 'mjs': '',
      \ 'jsx': '',
      \ 'rb': '',
      \ 'conf': '',
      \ 'ini': '',
      \ 'yml': '',
      \ 'yaml': '',
      \ 'toml': '',
      \ 'bat': '',
      \ 'jpg': '',
      \ 'jpeg': '',
      \ 'bmp': '',
      \ 'png': '',
      \ 'gif': '',
      \ 'ico': '',
      \ 'cpp': '',
      \ 'c++': '',
      \ 'cxx': '',
      \ 'cc': '',
      \ 'cp': '',
      \ 'c': '',
      \ 'cs': '',
      \ 'h': '',
      \ 'hh': '',
      \ 'hpp': '',
      \ 'hxx': '',
      \ 'lua': '',
      \ 'java': '',
      \ 'sh': '',
      \ 'fish': '',
      \ 'bash': '',
      \ 'zsh': '',
      \ 'ksh': '',
      \ 'csh': '',
      \ 'awk': '',
      \ 'ps1': '',
      \ 'diff': '',
      \ 'db': '',
      \ 'sql': '',
      \ 'dump': '',
      \ 'go': '',
      \ 'ex': '',
      \ 'exs': '',
      \ 'eex': '',
      \ 'leex': '',
      \ 'vim': '',
      \ 'vue': '﵂',
      \}

function! s:get_icon(path)
  if a:path[-1:] ==# '/'
    return ''
  else
    let l:extension = split(a:path, '\.')[-1]
    return get(s:file_icons, l:extension, '')
  end
endfunction

call dirvish#add_icon_fn({ path -> s:get_icon(path) })
