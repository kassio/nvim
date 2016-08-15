let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_semantic_triggers =  {
      \   'javascript,elixir' : ['.'],
      \   'ruby' : ['.', '::'],
      \   'vim': ['.', '#', ':']
      \ }

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
