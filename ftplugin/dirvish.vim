setlocal nonumber norelativenumber

nnoremap <nowait><buffer><buffer> h :keeppatterns g@\v/\.[^\/]+/?$@d<cr>
nmap     <nowait><buffer><buffer> <C-R> R
nmap     <nowait><buffer><buffer> i /

nmap     <nowait><buffer><buffer> gu    <Plug>(dirvish_up)
nmap     <nowait><buffer><buffer> q     <Plug>(dirvish_quit)

nnoremap <nowait><buffer><buffer> e :call dirvish#open('edit', 0)<CR>
xnoremap <nowait><buffer><buffer> e :call dirvish#open('edit', 0)<CR>
nnoremap <nowait><buffer><buffer> v :call dirvish#open('vsplit', 0)<CR>
xnoremap <nowait><buffer><buffer> v :call dirvish#open('vsplit', 0)<CR>
nnoremap <nowait><buffer><buffer> t :call dirvish#open('tabedit', 0)<CR>
xnoremap <nowait><buffer><buffer> t :call dirvish#open('tabedit', 0)<CR>

nnoremap <nowait><buffer><buffer> a o
nnoremap <nowait><buffer><buffer> a o

sort r /[^\/]$/
