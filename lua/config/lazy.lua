-- 在 ~/.config/nvim/lua/config/lazy.lua 或 init.lua 中
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		-- 使用镜像地址
		--"https://mirror.ghproxy.com/https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	git = {
		-- 使用镜像 URL 前缀
		-- url_format = "https://mirror.ghproxy.com/https://github.com/%s.git",
		-- 或使用 GitClone
		--url_format = "https://gitclone.com/github.com/%s.git",
	},
	performance = {
		reset_packpath = true,
	},
	-- 文件树
	{ "nvim-tree/nvim-tree.lua", keys = { "<leader>e" } },

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
	},

	-- Hop
	{ "phaazon/hop.nvim", keys = { "<leader>hp" } },

	-- LSP 辅助
	{ "nvimdev/lspsaga.nvim", event = "LspAttach" },
	{ "nvimtools/none-ls.nvim", event = "LspAttach" },
	{ "neovim/nvim-lspconfig", event = "BufReadPre" },

	-- 语法高亮
	{ "nvim-treesitter/nvim-treesitter", event = "BufReadPost" },
	{ "HiPhish/rainbow-delimiters.nvim", event = "BufReadPost" },

	-- 其他延迟插件
	{ "windwp/nvim-autopairs", event = "InsertEnter" },
	{ "lukas-reineke/indent-blankline.nvim", event = "BufReadPost" },
	{ "norcalli/nvim-colorizer.lua", event = { "BufReadPre", "BufNewFile" } },
	{ "folke/noice.nvim", event = "VeryLazy" },
	{ "folke/which-key.nvim", event = "VeryLazy" },
	{ "wakatime/vim-wakatime", event = "VeryLazy" },
})
