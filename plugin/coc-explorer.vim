let g:coc_explorer_global_presets = {
      \   'default': {
      \     'width': 35,
      \     'position': 'right',
      \     'toggle': v:true,
      \     'previewAction': {
      \       'onHover': v:false
      \     },
      \     'sources': [
      \       { 'name': 'file', 'expand': v:true }
      \     ]
      \   }
      \ }
nmap <leader>p :CocCommand explorer --preset default<cr>
