return {
	"folke/tokyonight.nvim",
	lazy = false, -- 启动时立刻加载主题
	priority = 1000, -- 优先级高于其他配色
	opts = {
		style = "moon",
		transparent = true,
		terminal_colors = true,
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			functions = { bold = true },
			variables = {},
			sidebars = "transparent",
			floats = "transparent",
		},
		sidebars = { "qf", "help", "terminal", "packer", "NvimTree" },
		day_brightness = 0.3,
		dim_inactive = true,
		lualine_bold = true,

		on_colors = function(colors)
			colors.border = "#565f89"
			colors.bg_statusline = "#1f2335"
		end,

		on_highlights = function(hl, c)
			hl.CursorLineNr = { fg = c.orange, bold = true }
			hl.LineNr = { fg = c.comment }
			hl.NvimTreeNormal = { bg = "NONE" }
			hl.NormalFloat = { bg = "NONE" }
		end,
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd("colorscheme tokyonight")
		vim.cmd("syntax on")
	end,
}
