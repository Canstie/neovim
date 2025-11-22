local opt = vim.opt
local g = vim.g

vim.cmd("language en_US.UTF-8")

g.encoding = "UTF-8"
opt.fileencoding = "utf-8"
vim.o.startofline = false -- 不要自动跳到行首
vim.o.smoothscroll = true -- Neovim 0.10+ 自带平滑滚动
vim.o.scrolloff = 8
opt.expandtab = true
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 0
opt.cursorline = true
opt.signcolumn = "yes"
opt.shiftround = true
opt.whichwrap = "<,>,[,]"
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.hidden = true
opt.timeoutlen = 800
opt.showtabline = 2
opt.tabline = "%!''"
opt.termguicolors = true
opt.laststatus = 3
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.clipboard = "unnamedplus"
opt.splitbelow = true
opt.splitright = true

opt.autoread = true
opt.showmode = false
