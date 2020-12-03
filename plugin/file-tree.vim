let g:lua_tree_side = 'right'
let g:lua_tree_width = 32
let g:lua_tree_show_icons = {
      \ 'git': 1,
      \ 'folders': 1,
      \ 'files': 0,
      \ }

let g:lua_tree_icons = {
    \ 'default': ' ',
    \ 'symlink': '»',
    \ 'git': {
    \   'unstaged': "%",
    \   'staged': "+",
    \   'unmerged': "?",
    \   'renamed': "➜",
    \   'untracked': "-"
    \   },
    \ 'folder': {
    \   'default': "▸",
    \   'open': "▾"
    \   }
    \ }

let g:lua_tree_bindings = {
    \ 'edit': ['<CR>', 'o'],
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
  au Filetype LuaTree set nonu nornu
aug END

nnoremap <leader>p :LuaTreeToggle<CR>
nnoremap <leader>fl :LuaTreeFindFile<CR>
