-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set({ "n", "i" }, "<C-z>", "<Cmd>undo<CR>", { silent = true })
vim.keymap.set("i", "jj", "<C-[>", { silent = true })
vim.keymap.set({ "n", "i" }, "<C-h>", "<C-w>h")
vim.keymap.set({ "n", "i" }, "<C-l>", "<C-w>l")
vim.keymap.set({ "n", "i" }, "<C-j>", "<C-w>j")
vim.keymap.set({ "n", "i" }, "<C-k>", "<C-w>k")
vim.keymap.set("c", "<C-v>", "<C-R>+", { noremap = true })

local wk = require("which-key")

wk.add({
	-- 🌟 文件 & 查找
	{ "<leader>f", group = "Find/Telescope" },
	{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
	{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
	{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find Buffer" },
	-- 历史 / 最近文件
	{ "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "最近打开的文件" },

	-- 命令 / 选项
	{ "<leader>fc", "<cmd>Telescope commands<CR>", desc = "命令搜索" },
	{ "<leader>fo", "<cmd>Telescope vim_options<CR>", desc = "Vim 选项" },

	-- 颜色主题
	{ "<leader>ft", "<cmd>Telescope colorscheme<CR>", desc = "切换主题" },
	-- ⚙️ LSP 功能
	{ "<leader>l", group = "LSP" },
	{ "<leader>la", ":Lspsaga code_action<CR>", desc = "代码修复" },
	{ "<leader>ld", ":Lspsaga goto_definition<CR>", desc = "转到定义" },
	{ "<leader>lh", ":Lspsaga hover_doc<CR>", desc = "悬浮文档" },
	{ "<leader>lR", ":Lspsaga finder<CR>", desc = "查找引用/定义" },
	{ "<leader>lr", ":Lspsaga rename<CR>", desc = "重命名符号" },
	{ "<leader>lo", ":Lspsaga outline<CR>", desc = "代码结构" },
	{ "<leader>ln", ":Lspsaga diagnostic_jump_next<CR>", desc = "下一个诊断" },
	{ "<leader>lp", ":Lspsaga diagnostic_jump_prev<CR>", desc = "上一个诊断" },

	-- 🧩 插件
	{ "<leader>p", group = "Plugins" },
	{ "<leader>pm", "<cmd>Mason<CR>", desc = "Mason Manager" },

	-- 🔧 工具类
	{ "<leader>t", group = "Tools" },
	{ "<leader>tt", "<cmd>Telescope<CR>", desc = "Telescope Menu" },

	-- 🧹 退出
	{ "<leader>q", "<cmd>qa<CR>", desc = "Quit All" },
})
