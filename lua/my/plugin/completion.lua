local keymap =  require'my/utils'.keymap
local g = vim.g

g.completion_matching_smart_case = 1
g.completion_auto_change_source = 1
g.completion_enable_auto_pop = 1
g.completion_enable_auto_signature = 0
g.completion_trigger_keyword_length = 3
g.completion_enable_snippet = 'UltiSnips'
g.completion_sorting = 'alphabet'
g.completion_confirm_key = '<cr>'
g.completion_matching_strategy_list = { 'exact', 'substring' }
g.completion_chain_complete_list = {
  default = {
    { complete_items = { 'ts' } },
    { complete_items = { 'buffers' } },
    { complete_items = { 'snippet' } },
    { complete_items = { 'lsp' } },
    { complete_items = { 'path' } },
    { mode = { '<c-n>' } }
  }
}

keymap('i', '<tab>', '<Plug>(completion_smart_tab)', { noremap = false })
keymap('i', '<s-tab>', '<Plug>(completion_smart_s_tab)', {  noremap = false  })
