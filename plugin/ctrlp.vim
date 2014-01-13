" CtrlP easy open files
let g:ctrlp_working_path_mode = 0
let g:ctrlp_switch_buffer = 'ETV'
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_custom_ignore = '\v[\/](tags|gem.tags|.git|log|vendor/bundler/bin)$'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
let g:ctrlp_dont_split = 'netrw\|help\|quickfix\|nerdtree'
let g:ctrlp_abbrev = {
      \ 'abbrevs': [
      \ { 'pattern': '^j/', 'expanded': 'assets/javascripts/' },
      \ { 'pattern': '^style/', 'expanded': 'assets/stylesheets/' },
      \ { 'pattern': '\v(^|\/)c/', 'expanded': 'controllers/' },
      \ { 'pattern': '\v(^|\/)m/', 'expanded': 'models/' },
      \ { 'pattern': '\v(^|\/)v/', 'expanded': 'views/' },
      \ { 'pattern': '\v(^|\/)h/', 'expanded': 'helpers/' },
      \ { 'pattern': '^s/', 'expanded': 'spec/' },
      \ { 'pattern': '^am/', 'expanded': 'activemodel/' },
      \ { 'pattern': '^aml/', 'expanded': 'actionmailer/' },
      \ { 'pattern': '^ap/', 'expanded': 'actionpack/' },
      \ { 'pattern': '^ar/', 'expanded': 'activerecord/' },
      \ { 'pattern': '^as/', 'expanded': 'activesupport/' },
      \ { 'pattern': '^av/', 'expanded': 'actionview/' }
      \ ]
      \ }

noremap <c-n> :CtrlPLine %<CR>
