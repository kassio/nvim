let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_semantic_triggers =  {
      \   'javascript,elixir' : ['.'],
      \   'ruby' : ['.', '::']
      \ }

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
