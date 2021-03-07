let g:ruby_path=system('echo "${ASDF_USER_SHIMS}/ruby"')

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_use_bundler = 1

let g:ruby_indent_access_modifier_style = 'normal'
let g:ruby_indent_block_style = 'do'
let g:ruby_indent_assignment_style = 'variable'

let g:ruby_operators = 1
let g:ruby_space_errors = 1
let g:ruby_spellcheck_strings = 1

command! -range LetToVariable
      \ call user#ruby#let_to_variable(<line1>, <line2>)
command! -range VariableToLet
      \ call user#ruby#variable_to_let(<line1>, <line2>)

command! -range NewRubyHashSyntax
      \ call user#ruby#new_ruby_hash_syntax(<line1>, <line2>)
command! -range OldRubyHashSyntax
      \ call user#ruby#old_ruby_hash_syntax(<line1>, <line2>)

command! -range StringfyHashKeys
      \ call user#ruby#stringfy_hash_keys(<line1>, <line2>)
command! -range SymbolifyHashKeys
      \ call user#ruby#symbolify_hash_keys(<line1>, <line2>)

command! -range=% Decolunize
      \ call user#ruby#decolunize(<line1>, <line2>)

command! Alternate
      \ call user#ruby#alternate_file(<q-mods>)

call textobj#user#plugin('rubyblock', {
      \   '-': {
      \     'select-a-function': 'textobj#ruby#block_a',
      \     'select-a': 'ar',
      \     'select-i-function': 'textobj#ruby#block_i',
      \     'select-i': 'ir'
      \   }
      \ })

command! -buffer Namespace call user#ruby#namespace()
command! -buffer CopyNamespace call user#ruby#copy_namespace()

hi! link Keyword Exception
hi! link Function Normal
