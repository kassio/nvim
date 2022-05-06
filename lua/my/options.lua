local opt = vim.opt
local g = vim.g

opt.autowriteall = true
opt.backup = false
opt.cindent = true
opt.colorcolumn = { 80, 100, 120 }
opt.complete:remove('t')
opt.completeopt = { 'menu', 'menuone', 'preview', 'noselect' }
opt.confirm = true
opt.copyindent = true
opt.dictionary = '/usr/share/dict/words'
opt.diffopt = { 'internal', 'filler', 'closeoff', 'vertical' }
opt.expandtab = true
opt.fileencodings = { 'utf8', 'nobomb' }
opt.fileformats = { 'unix', 'mac' }
opt.foldenable = false
opt.foldmethod = 'manual'
opt.ignorecase = true
opt.inccommand = 'nosplit'
opt.infercase = true
opt.list = true
opt.listchars = {
  extends = '>',
  lead = '·',
  multispace = '++',
  nbsp = '·',
  precedes = '<',
  tab = '≫·',
  trail = '·',
}
opt.mouse = 'a'
opt.number = true
opt.numberwidth = 5
opt.relativenumber = true
opt.secure = true
opt.sessionoptions = { 'winpos', 'tabpages', 'help' }
opt.shiftround = true
opt.shiftwidth = 2
opt.shortmess = 'actToOFI'
opt.showmatch = true
opt.showmode = false
opt.showtabline = 2
opt.signcolumn = 'yes'
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 2
opt.spell = true
opt.spelllang = 'en'
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
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
opt.wrap = false
opt.writebackup = false

-- Space as map leader
g.mapleader = ' '

-- Disable standard plugins
g.loaded_gzip = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1

g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_2html_plugin = 1

g.loaded_matchit = 1
g.loaded_matchparen = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1

g.do_filetype_lua = 1
