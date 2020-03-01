setlocal nonumber norelativenumber
setlocal nospell

nnoremap <nowait><buffer> h :keeppatterns g@\v/\.[^\/]+/?$@d<cr>
nmap     <nowait><buffer> <C-R> R
nmap     <nowait><buffer> i /

nmap     <nowait><buffer> gu    <Plug>(dirvish_up)
nmap     <nowait><buffer> q     <Plug>(dirvish_quit)

nnoremap <nowait><buffer> e :call dirvish#open('edit', 0)<CR>
xnoremap <nowait><buffer> e :call dirvish#open('edit', 0)<CR>
nnoremap <nowait><buffer> v :call dirvish#open('vsplit', 0)<CR>
xnoremap <nowait><buffer> v :call dirvish#open('vsplit', 0)<CR>
nnoremap <nowait><buffer> t :call dirvish#open('tabedit', 0)<CR>
xnoremap <nowait><buffer> t :call dirvish#open('tabedit', 0)<CR>

nnoremap <nowait><buffer> a o
nnoremap <nowait><buffer> a o

nnoremap <nowait><buffer> m :call user#dirvish#exec(getline('.'))<CR>

sort r /[^\/]$/
