return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = { "lua", "go", "vue", "python", "rust" },
		highlight = {
			enable = true,
		},
	},
}
