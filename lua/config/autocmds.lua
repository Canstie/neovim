-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})
autocmd("TermOpen", {
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
	end,
})
-- 高亮复制内容
autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ timeout = 250 })
	end,
})
-- 自动保存光标位置
autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			vim.api.nvim_win_set_cursor(0, mark)
		end
	end,
})

-- 打开 nvim-tree 时自动调整 bufferline
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "NvimTree_*",
	callback = function()
		require("bufferline.api").set_offset(31, "File Explorer")
	end,
})
vim.api.nvim_create_autocmd("BufWinLeave", {
	pattern = "NvimTree_*",
	callback = function()
		require("bufferline.api").set_offset(0)
	end,
})
