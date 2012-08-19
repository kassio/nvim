" Snipmate
source ~/.vim/snippets/support_functions.vim
autocmd vimenter * call s:SetupSnippets()
function! s:SetupSnippets()
  if filereadable("./config/environment.rb")
    call ExtractSnips("~/.vim/snippets/ruby-rails", "ruby")
    call ExtractSnips("~/.vim/snippets/eruby-rails", "eruby")
  endif
  call ExtractSnips("~/.vim/snippets/html", "eruby")
  call ExtractSnips("~/.vim/snippets/html", "xhtml")
  call ExtractSnips("~/.vim/snippets/html", "php")
endfunction
