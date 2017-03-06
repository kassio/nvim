let g:ruby_path=system('echo "${RBENV_ROOT}/versions/$(rbenv version-name)/bin/ruby"')

" Ruby Completion
setlocal omnifunc=syntaxcomplete#Complete

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_use_bundler = 1

let g:ruby_indent_access_modifier_style = 'normal'
let g:ruby_indent_block_style = 'do'
let g:ruby_indent_assignment_style = 'variable'

let ruby_operators = 1
let ruby_space_errors = 1
let ruby_spellcheck_strings = 1

command! -range LetToVariable call personal#ruby#let_to_variable(<line1>, <line2>)
command! -range VariableToLet call personal#ruby#variable_to_let(<line1>, <line2>)

command! -range NewRubyHashSyntax call personal#ruby#new_ruby_hash_syntax(<line1>, <line2>)
command! -range OldRubyHashSyntax call personal#ruby#old_ruby_hash_syntax(<line1>, <line2>)

command! -range SymbolKeyToString call personal#ruby#symbol_key_to_string(<line1>, <line2>)
command! -range StringKeyToSymbol call personal#ruby#string_key_to_symbol(<line1>, <line2>)

command! -range SymbolHashToString call personal#ruby#symbol_hash_to_string(<line1>, <line2>)
command! -range StringHashToSymbol call personal#ruby#string_hash_to_symbol(<line1>, <line2>)

let s:block_start = '\(\<do\>\|\<if\>\).*$'
let s:block_end = '^\s*\<end\>'
call textobj#user#plugin('rubyblock', {
      \   'block-i': {
      \     'pattern': [s:block_start.'\n', s:block_end],
      \     'select-i': 'ib',
      \   },
      \   'block-a': {
      \     'pattern': [s:block_start, s:block_end],
      \     'select-a': 'ab',
      \     'region-type': 'V'
      \   },
      \   'erb': {
      \     'pattern': ['<%=\?\s\?', '\s\?%>'],
      \     'select-a': 'ae',
      \     'select-i': 'ie'
      \   }
      \ })
