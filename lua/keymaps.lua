local keymap = vim.my.utils.keymap
local lua_keymap = vim.my.utils.lua_keymap

------------------------------------------------------------
-- Operation pending maps need to be passed as string
-- expressions to vim, hence the double quote
--
-- select current line (inner)
keymap('x', 'il', ':<c-u>normal! g_v_<cr>')
keymap('o', 'il', '":normal vil<cr>"', { expr = true })

-- select current line (outer)
keymap('x', 'al', ':<c-u>normal! g_v0<cr>')
keymap('o', 'al', '":normal val<cr>"', { expr = true })

-- select all lines
keymap('x', 'aF', ':<c-u>keepjumps normal! GVgg0<cr>')
keymap('o', 'aF', '":normal vaF<cr>"', { expr = true })
------------------------------------------------------------

-- disable ex mode
keymap('n', [[Q]], [[<nop>]])

-- use gj/gk by default to better navigation on wrapped lines
keymap('n', 'j', 'gj')
keymap('n', 'k', 'gk')

-- faster esc
keymap('i', '<esc>', '<c-c>')

-- undo breakpoints
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
keymap('n', '9gt', '<cmd>tablast<cr>')

-- paste without replacing the " register
keymap('v', '<leader>p', '"_dP')

-- search current word (ignore case)
lua_keymap('n', '!', 'vim.my.utils.highlight{current = true}')
-- search current selection (ignore case)
lua_keymap('v', '!', 'vim.my.utils.highlight{selected = true}')

-- search current word (sensitive case)
lua_keymap('n', '<leader>!', 'vim.my.utils.highlight{current = true, sensitive_case = true}')
-- search current selection (sensitive case)
lua_keymap('v', '<leader>!', 'vim.my.utils.highlight{selected = true, sensitive_case = true}')

-- search current word (ignore case, exclusive)
lua_keymap('n', 'g!', 'vim.my.utils.highlight{current = true, exclusive = true}')
-- search current selection (ignore case, exclusive)
lua_keymap('v', 'g!', 'vim.my.utils.highlight{selected = true, exclusive = true}')

-- search current word (sensitive case, exclusive)
lua_keymap('n', '<leader>g!', 'vim.my.utils.highlight{current = true, sensitive_case = true, exclusive = true}')
-- search current selection (sensitive case, exclusive)
lua_keymap('v', '<leader>g!', 'vim.my.utils.highlight{selected = true, sensitive_case = true, exclusive = true}')

-- indent current buffer
lua_keymap('n', '<leader>ff', 'vim.my.buffers.indent()')

-- delete current buffer
lua_keymap('n', '<leader>bo', 'vim.my.buffers.only()')
keymap('n', '<leader>bd', '<cmd>bw!<cr>')
keymap('n', '<leader>da', '<cmd>bufdo bw!<cr>')

-- close floating windows
lua_keymap('n', '<leader>wa', 'vim.my.windows.close_floating()')

-- session management
keymap('n', '<leader>ss', '<cmd>SessionSave<cr>')
keymap('n', '<leader>sl', '<cmd>SessionLoad<cr>')
keymap('n', '<leader>sd', '<cmd>SessionDestroy<cr>')
