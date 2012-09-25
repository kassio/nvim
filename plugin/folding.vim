" Foldmaps
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

function! ToggleFoldMethod()
if &foldmethod == 'manual'
	set foldmethod=syntax
else
	set foldmethod=manual
endif
endfunction
nnoremap ,zm :call ToggleFoldMethod()<CR>:echo &foldmethod<CR>

noremap <F3> zM
noremap <F4> zR
nnoremap <space> za
autocmd FileType ruby,c,sh,java set foldmethod=syntax foldenable foldcolumn=1 foldlevel=999

hi FoldColumn ctermfg=182
