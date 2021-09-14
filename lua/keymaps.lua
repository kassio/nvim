local keymap = vim.my.utils.keymap
local lua_keymap = vim.my.utils.lua_keymap

-- make Y behave like C and D
keymap('n', 'Y', 'y$')

-- disable ex mode
keymap('n', [[Q]], [[<nop>]])

-- use gj/gk by default to better navigation on wrapped lines
keymap('n', 'j', 'gj')
keymap('n', 'k', 'gk')

-- Use <c-l> to clear the highlighting of :set hlsearch.
keymap('n', '<c-l>', ':silent! mode | nohlsearch<cr>')

-- faster esc
keymap('i', '<esc>', '<c-c>')

-- undo breakpoints
keymap('i', '<c-u>', '<c-g>u<c-u>')
keymap('i', ',', ',<c-g>u')
keymap('i', '.', '.<c-g>u')
keymap('i', '!', '!<c-g>u')
keymap('i', '?', '?<c-g>u')
keymap('i', '(', '(<c-g>u')
keymap('i', ')', ')<c-g>u')
keymap('i', '}', '}<c-g>u')
keymap('i', '{', '{<c-g>u')
keymap('i', '[', '[<c-g>u')
keymap('i', ']', ']<c-g>u')
keymap('i', '_', '_<c-g>u')
keymap('i', '-', '-<c-g>u')
keymap('i', '#', '#<c-g>u')

-- keep the cursor centered while moving
keymap('n', 'n,', 'nzzzv')
keymap('n', 'N,', 'Nzzzv')
keymap('n', 'J,', 'mzJ`z')

-- escape from terminal mode with double <esc>
keymap('t', [[<esc><esc>]], [[<c-\><c-n>]])

-- move to the last tab
keymap('n', '9gt', ':tablast<cr>')

-- search current word
lua_keymap('n', '!', 'vim.my.utils.highlight{current = true}')
lua_keymap('n', '<leader>ff', 'vim.my.buffers.indent()')

-- delete current buffer
lua_keymap('n', '<leader>bd', 'vim.api.nvim_buf_delete(0, { force = true })')
-- delete all buffers
lua_keymap('n', '<leader>da', 'vim.my.buffers.delete_all()')
-- delete unloaded buffers
lua_keymap('n', '<leader>wa', 'vim.my.utils.clean_buffers_and_windows()')

-- moving selected text down
keymap('v', '<c-j>', ":m '>+1<CR>gv=gv")
-- moving selected text up
keymap('v', '<c-k>', ":m '<-2<CR>gv=gv")

-- session management
lua_keymap('n', '<leader>ss', 'vim.my.sessions.save()')
lua_keymap('n', '<leader>sl', 'vim.my.sessions.load()')
lua_keymap('n', '<leader>sd', 'vim.my.sessions.destroy()')

-- select current line (inner)
keymap('x', 'il', ':<c-u>normal! g_v_<cr>')
keymap('o', 'il', ':<c-u>normal! vil')

-- select current line (outer)
keymap('x', 'al', ':<c-u>normal! g_v0<cr>')
keymap('o', 'al', ':<c-u>normal! val')
