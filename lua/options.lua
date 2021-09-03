local opt = vim.opt
local g = vim.g

opt.autowriteall = true
opt.cindent = true
opt.colorcolumn = { 80, 100, 120 }
opt.complete = { '.', 'w', 'b', 'u' }
opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
opt.confirm = true
opt.copyindent = true
opt.dictionary = '/usr/share/dict/words'
opt.diffopt = { 'internal', 'filler', 'closeoff', 'vertical' }
opt.expandtab = true
opt.fileencodings = { 'utf8', 'nobomb' }
opt.fileformats = { 'unix', 'mac' }
opt.fillchars = 'vert:│'
opt.foldmethod = 'manual'
opt.ignorecase = true
opt.inccommand = 'nosplit'
opt.infercase = true
opt.list = true
opt.listchars = {
  tab = '> ',
  trail = '-',
  nbsp = '+',
  precedes = '<',
  extends = '>'
}
opt.mouse = 'a'
opt.backup = false
opt.foldenable = false
opt.showmode = false
opt.swapfile = false
opt.wrap = false
opt.writebackup = false
opt.number = true
opt.numberwidth = 5
opt.relativenumber = true
opt.scrolloff = 10
opt.secure = true
opt.sessionoptions = { 'winpos', 'tabpages', 'help' }
opt.shiftround = true
opt.shiftwidth = 2
opt.shortmess = 'actToOFI'
opt.showmatch = true
opt.showtabline = 2
opt.signcolumn = 'yes'
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 2
opt.spell = true
opt.spelllang = 'en'
opt.splitbelow = true
opt.splitright = true
opt.switchbuf = { 'useopen', 'usetab', 'split' }
opt.tabstop = 2
opt.tags = ''
opt.termguicolors = true
opt.textwidth = 100
opt.title = true
opt.titlestring = "%{substitute(expand('%:p'), $HOME, '$HOME', '')}"
opt.undofile = true
opt.undolevels = 10000
opt.undoreload = 10000
opt.virtualedit = 'block'
opt.wildignorecase = true
opt.wildoptions = 'pum'

-- Space as map leader
g.mapleader = ' '

-- Highlight lua within vim
g.vimsyn_embed = 'l'

-- Disable standard plugins
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1

vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1

vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1

-- Global signs icons
g.sign_error = '×'
g.sign_hint = '☺'
g.sign_info = 'ⅰ'
g.sign_warning = '⚠'
