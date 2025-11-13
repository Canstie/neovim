return {
	"saghen/blink.cmp",
	version = "*",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"fang2hou/blink-copilot",
	},
	event = "VeryLazy",
	opts = {
		completion = {
			documentation = {
				auto_show = true,
			},
		},
		keymap = {
			preset = "super-tab",
		},
		sources = {
			default = { "copilot", "path", "snippets", "buffer", "lsp" },
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-copilot",
					score_offset = 100,
					async = true,
				},
			},
		},
		cmdline = {
			sources = function()
				local cmd_type = vim.fn.getcmdtype()
				if cmd_type == "/" then
					return { "buffer" }
				end
				if cmd_type == ":" then
					return { "cmdline" }
				end
				return {}
			end,
			keymap = {
				preset = "super-tab",
			},
			completion = {
				menu = {
					auto_show = true,
				},
			},
		},
	},
}
