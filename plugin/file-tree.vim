let g:nvim_tree_side = 'right'
let g:nvim_tree_hide_dotfiles = 1
let g:nvim_tree_width = 32
let g:nvim_tree_git_hl = 1
let g:nvim_tree_show_icons = {
      \ 'git': 1,
      \ 'folders': 1,
      \ 'files': 0,
      \ }

let g:nvim_tree_icons = {
    \ 'default': '∙',
    \ 'symlink': '⇔',
    \ 'git': {
    \   'unstaged': '*',
    \   'staged': '+',
    \   'unmerged': '?',
    \   'renamed': '»',
    \   'untracked': '%'
    \   },
    \ 'folder': {
    \   'default': '▸',
    \   'open': '▾'
    \   }
    \ }

let g:nvim_tree_bindings = {
    \ 'edit': ['<cr>', 'o'],
    \ 'edit_vsplit': 'S',
    \ 'edit_split': 's',
    \ 'edit_tab': 't',
    \ 'toggle_ignored': 'I',
    \ 'toggle_dotfiles': 'H',
    \ 'refresh': 'R',
    \ 'cd': 'C',
    \ 'create': 'a',
    \ 'remove': 'D',
    \ 'rename': 'M',
    \ 'copy': 'c',
    \ 'paste': 'p',
    \ }

aug user:file-tree
  au!
  au Filetype NvimTree set nonu nornu
aug END

nnoremap <leader>p :NvimTreeToggle<CR>
nnoremap <leader>fl :NvimTreeFindFile<CR>
