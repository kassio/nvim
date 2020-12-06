require'my/setup'.setup()

vim.o.termguicolors = true
vim.o.lazyredraw = true
vim.o.regexpengine = 2
vim.o.colorcolumn = '80,100,120'
vim.o.synmaxcol = 200

vim.o.inccommand = 'nosplit'
vim.o.wildoptions = 'pum'
vim.o.completeopt = 'menuone,noinsert,noselect'

vim.o.autowriteall = true

vim.o.fileencodings = 'utf8,nobomb'

vim.o.showmatch = true
vim.o.showmode = false

vim.o.confirm = true

vim.o.shortmess = 'actToOFI'

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.diffopt = 'internal,filler,closeoff,vertical'

vim.o.relativenumber = true
vim.o.number = true
vim.o.numberwidth = 3

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.cursorline = false

vim.o.switchbuf = 'useopen,usetab,split'

vim.o.virtualedit = 'block'

vim.o.hidden = true

vim.o.updatetime = 300

vim.o.signcolumn = 'yes'

vim.o.infercase = true
vim.o.tags = 'tags,tags.gems'
vim.o.tagcase = 'followscs'

vim.o.wildignorecase = true
vim.o.wildignore = '*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov'

vim.o.wrap = false
vim.o.textwidth = 100
vim.o.sidescroll = 5

vim.o.list = true
vim.o.listchars = 'tab:> ,trail:-,nbsp:+,precedes:<,extends:>'

vim.o.sessionoptions = 'winpos,tabpages,help'

vim.o.copyindent = true
vim.o.cindent = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.shiftround = true

vim.o.foldmethod = 'manual'
vim.o.foldenable = false

vim.o.fileformats = vim.o.fileformats .. ',mac'

vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

vim.o.spell = true
vim.o.spelllang = 'en'

vim.o.undofile = true
vim.o.undoreload = 10000

vim.o.title = true
vim.o.titlestring = "%{substitute(expand('%:p'), $HOME, '$HOME', '')}"

vim.o.statusline = ''
vim.o.showtabline = 2
vim.o.tabline = '%!tabline#update()'

vim.o.mouse = 'a'

vim.o.fillchars = 'vert:┃'

vim.o.maxmempattern = 10000

vim.o.grepformat = '%f:%l:%c:%m,%f:%l:%m'
vim.o.grepprg = 'ag --follow --smart-case --vimgrep --skip-vcs-ignores --hidden --nocolor'

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
