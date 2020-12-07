require'my'.setupPluginManager()

vim.bo.cindent = true
vim.bo.copyindent = true
vim.bo.expandtab = true
vim.bo.infercase = true
vim.bo.shiftwidth = 2
vim.bo.smartindent = true
vim.bo.softtabstop = 2
vim.bo.spelllang = 'en'
vim.bo.swapfile = false
vim.bo.tabstop = 2
vim.bo.textwidth = 100
vim.bo.undofile = true
vim.bo.undolevels = 10000

vim.o.autowriteall = true
vim.o.backup = false
vim.o.colorcolumn = '80,100,120'
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.confirm = true
vim.o.diffopt = 'internal,filler,closeoff,vertical'
vim.o.fileencodings = 'utf8,nobomb'
vim.o.fileformats = 'unix,mac'
vim.o.fillchars = 'vert:┃'
vim.o.grepformat = '%f:%l:%c:%m,%f:%l:%m'
vim.o.grepprg = 'rg --follow --smart-case --vimgrep --no-ignore-vcs --hidden --color never'
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.inccommand = 'nosplit'
vim.o.lazyredraw = true
vim.o.maxmempattern = 10000
vim.o.mouse = 'a'
vim.o.regexpengine = 2
vim.o.sessionoptions = 'winpos,tabpages,help'
vim.o.shiftround = true
vim.o.shortmess = 'actToOFI'
vim.o.showmatch = true
vim.o.showmode = false
vim.o.showtabline = 2
vim.o.sidescroll = 5
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.statusline = ''
vim.o.switchbuf = 'useopen,usetab,split'
vim.o.synmaxcol = 200
vim.o.tabline = '%!tabline#update()'
vim.o.tagcase = 'followscs'
vim.o.tags = 'tags,tags.gems'
vim.o.termguicolors = true
vim.o.title = true
vim.o.titlestring = "%{substitute(expand('%:p'), $HOME, '$HOME', '')}"
vim.o.undoreload = 10000
vim.o.virtualedit = 'block'
vim.o.wildignore = '*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov'
vim.o.wildignorecase = true
vim.o.wildoptions = 'pum'
vim.o.writebackup = false

vim.wo.cursorline = false
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
