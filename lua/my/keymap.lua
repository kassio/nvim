local keymap = require'my/utils'.keymap

keymap('n', [[j]], [[gj]])
keymap('n', [[k]], [[gk]])

-- faster esc
keymap('i', [[<esc>]], [[<c-c>]])
keymap('i', [[<c-u>]], [[<c-g>u<c-u>]])

keymap('t', [[<esc><esc>]], [[<c-\><c-n>]])

-- Use <c-l> to clear the highlighting of :set hlsearch.
keymap('n', [[<c-l>]], [[:mode | nohlsearch<cr>]])

-- Delete current buffer
keymap('n', [[<leader>bd]], [[:call buffer#kill()<cr>]])
-- Delete all other buffers
keymap('n', [[<leader>bo]], [[:call buffer#kill_others()<cr>]])
-- Delete all buffers
keymap('n', [[<leader>da]], [[:call buffer#kill_all()<cr>]])
-- Delete all unlisted/unloaded buffers
keymap('n', [[<leader>wa]], [[:call buffer#kill_unlisted()<cr>]])

keymap('n', [[g#]], [[#]])
keymap('n', [[g*]], [[*]])

keymap('n', [[']], [[`]])
keymap('n', [[`]], [[']])

keymap('v', [[!]], [[:<c-u>call text#highlight_visual()<cr>]])
keymap('v', [[#]], [[:<c-u>call text#highlight_visual()<cr>??<cr>]])
keymap('v', [[*]], [[:<c-u>call text#highlight_visual()<cr>//<cr>]])

keymap('n', [[!]], [[:call text#highlight(expand('<cword>'))<cr>]])
keymap('n', [[<leader>!]], [[:call text#highlight_sensitive(expand('<cword>'))<cr>]])
keymap('n', [[g!]], [[:call text#highlight('\<'.expand('<cword>').'\>')<cr>]])
keymap('v', [[<leader>!]], [[:<c-u>call text#highlight_sensitive_visual()<cr>]])
keymap('v', [[g!]], [[:<c-u>call text#highlight('\<'.text#get_visual().'\>')<cr>]])

keymap('n', [[Q]], [[<nop>]])

-- Indent all file
keymap('n', [[<leader>ff]], [[:call preserve#preserve('silent normal gg=G')<cr>]])

keymap('n', [[<leader>sn]], [[:call sign#goto('next')<cr>]])
keymap('n', [[<leader>sN]], [[:call sign#goto('previous')<cr>]])

-- move to the last tab
keymap('n', [[9gt]], [[:tablast<cr>]])

-- Command shortcuts/aliases
-- Replace in all buffers
keymap('c', [[<c-b>]], [[P bufdo %s///ge<left><left><left><left>]])
-- Highlight string without moving
keymap('c', [[<c-h>]], [[let @/ = ""<left>]])
