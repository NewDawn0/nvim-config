local opt = vim.opt

-- Statusline
opt.laststatus = 3
opt.showmode = false

-- Indenting
opt.smarttab = true
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4

opt.clipboard = "unnamedplus"
opt.fillchars = { eob = " " }
opt.mouse = "a"

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false
vim.cmd("set nu rnu") -- hybrid number
opt.hidden = true

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true
opt.undolevels = 1000
opt.wrap = false
opt.fileencoding = 'utf-8'

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250