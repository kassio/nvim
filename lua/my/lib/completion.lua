vim.g.completion_matching_smart_case = 1
vim.g.completion_auto_change_source = 1
vim.g.completion_enable_auto_pop = 1
vim.g.completion_enable_auto_signature = 0
vim.g.completion_trigger_keyword_length = 3
vim.g.completion_enable_snippet = 'UltiSnips'
vim.g.completion_sorting = 'alphabet'
vim.g.completion_matching_strategy_list = { 'exact', 'substring' }
vim.g.completion_chain_complete_list = {
  default = {
    { mode = { '<c-n>' } },
    { complete_items = { 'snippet' } },
    { complete_items = { 'lsp' } },
    { complete_items = { 'ts' } },
    { complete_items = { 'path' } },
    { complete_items = { 'buffers' } }
  }
}

vim.cmd [[imap <tab> <Plug>(completion_smart_tab)]]
vim.cmd [[imap <s-tab> <Plug>(completion_smart_s_tab)]]
vim.cmd [[let g:completion_confirm_key = "\<cr>"]]
