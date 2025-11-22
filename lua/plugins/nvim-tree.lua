return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		sync_root_with_cwd = true,
		respect_buf_cwd = true,
		view = {
			width = 30,
			side = "left",
		},
		update_focused_file = {
			enable = true,
		},
		actions = {
			open_file = {
				resize_window = true,
				quit_on_open = true,
			},
		},
	},
	keys = {
		{ "<leader>e", ":NvimTreeToggle<CR>" },
	},
}
