vim.g.completion_matching_smart_case = 1
vim.g.completion_auto_change_source = 1
vim.g.completion_trigger_keyword_length = 3
vim.g.completion_sorting = "alphabet"
vim.g.completion_matching_strategy_list = { 'exact', 'substring' }
vim.g.completion_chain_complete_list = {
  { mode = '<c-n>' },
  { complete_items = { 'lsp', 'UltiSnips', 'buffers', 'path', 'ts' } }
}
