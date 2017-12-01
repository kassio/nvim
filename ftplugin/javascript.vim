call matchadd('Comment', '\%1l^#!\/usr\/bin\/env.*Java[sS]cript')
call matchadd('Constant', '\(<\/\?\)\@<!\<\u\w*')
call matchadd('Function', '[a-zA-Z]\+\(\s*=\s*([^)]*)\)\@=')

hi! link xmlTagName xmlEndTag
