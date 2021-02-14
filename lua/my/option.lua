local set = vim.api.nvim_set_option

function setOptions(table)
  for option, value in pairs(table) do
    set(option, value)
  end
end

setOptions{
  -- Global
  autowriteall = true,
  backup = false,
  completeopt = 'menuone,noinsert,noselect',
  confirm = true,
  diffopt = 'internal,filler,closeoff,vertical',
  fileencodings = 'utf8,nobomb',
  fileformats = 'unix,mac',
  fillchars = 'vert:│',
  guicursor = 'n-v-c-sm:block,i-ci-ve:block,r-cr-o:hor20',
  ignorecase = true,
  inccommand = 'nosplit',
  mouse = 'a',
  secure = true,
  sessionoptions = 'winpos,tabpages,help',
  shiftround = true,
  shortmess = 'actToOFI',
  showmatch = true,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  splitbelow = true,
  splitright = true,
  switchbuf = 'useopen,usetab,split',
  tabline = '%!tabline#update()',
  tags = '',
  termguicolors = true,
  title = true,
  titlestring = "%{substitute(expand('%:p'), $HOME, '$HOME', '')}",
  undolevels = 10000,
  undoreload = 10000,
  virtualedit = 'block',
  wildignorecase = true,
  wildoptions = 'pum',
  writebackup = false,
  scrolloff = 10,

  -- Buffer,
  cindent = true,
  complete = '.,w,b,u',
  copyindent = true,
  expandtab = true,
  infercase = true,
  shiftwidth = 2,
  smartindent = true,
  softtabstop = 2,
  spelllang = 'en',
  swapfile = false,
  tabstop = 2,
  textwidth = 100,
  undofile = true,

  -- Window,
  colorcolumn = '80,100,120',
  foldenable = false,
  foldmethod = 'manual',
  list = true,
  listchars = 'tab:> ,trail:-,nbsp:+,precedes:<,extends:>',
  number = true,
  numberwidth = 3,
  relativenumber = true,
  signcolumn = 'yes',
  spell = true,
  wrap = false
}
