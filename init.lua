require'my'.setupPluginManager()

vim.o.autowriteall = true
vim.o.cindent = true
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.confirm = true
vim.o.copyindent = true
vim.o.diffopt = 'internal,filler,closeoff,vertical'
vim.o.expandtab = true
vim.o.fileencodings = 'utf8,nobomb'
vim.o.fileformats = 'unix,mac'
vim.o.fillchars = 'vert:|'
vim.o.inccommand = 'nosplit'
vim.o.infercase = true
vim.o.mouse = 'a'
vim.o.sessionoptions = 'winpos,tabpages,help'
vim.o.shiftround = true
vim.o.shiftwidth = 2
vim.o.shortmess = 'actToOFI'
vim.o.showmatch = true
vim.o.showtabline = 2
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.softtabstop = 2
vim.o.spelllang = 'en'
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.switchbuf = 'useopen,usetab,split'
vim.o.tabline = '%!tabline#update()'
vim.o.tabstop = 2
vim.o.tagcase = 'followscs'
vim.o.tags = 'tags,tags.gems'
vim.o.termguicolors = true
vim.o.textwidth = 100
vim.o.title = true
vim.o.titlestring = "%{substitute(expand('%:p'), $HOME, '$HOME', '')}"
vim.o.undofile = true
vim.o.undolevels = 10000
vim.o.undoreload = 10000
vim.o.virtualedit = 'block'
vim.o.wildignorecase = true
vim.o.wildoptions = 'pum'
vim.o.writebackup = false

vim.wo.colorcolumn = '80,100,120'
vim.wo.foldenable = false
vim.wo.foldmethod = 'manual'
vim.wo.list = true
vim.wo.listchars = 'tab:> ,trail:-,nbsp:+,precedes:<,extends:>'
vim.wo.number = true
vim.wo.numberwidth = 3
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
vim.wo.spell = true
vim.wo.wrap = false

vim.g.mapleader = ' '

-- Disable standard plugins
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_rrhelper = 1

-- global signs icons
vim.g.sign_error = '×'
vim.g.sign_warning = '⚠'
vim.g.sign_info = 'ⅰ'

my.setupPlugins()
