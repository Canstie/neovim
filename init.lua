-- bootstrap lazy.nvim, LazyVim and your plugins
vim.g.mapleader = " "
vim.g.maplocalleader = ","
require("config.options")
require("core.base")
require("config.lazy")
require("config.keymaps")
require("config.autocmds")

