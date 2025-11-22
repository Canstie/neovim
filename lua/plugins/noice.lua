return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		-- {"rcarriga/nvim-notify", opts = {background_colour = "#000000"}}
	},
	keys = {
		-- { "<leader>sN", "<CMD>Noice pick<CR>", desc = "[Noice] Pick history messages" },
		{ "<leader>N", "<CMD>Noice<CR>", desc = "[Noice] Show history messages" },
	},

	opts = {
		popupmenu = {
			enabled = false,
		},
		notify = {
			enabled = false,
		},
		lsp = {

			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = false,
				["vim.lsp.util.stylize_markdown"] = false,
			},
		},
		-- you can enable a preset for easier configuration
		presets = {
			bottom_search = false, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
		routes = {
			-- Hide search count
			{ filter = { event = "msg_show", kind = "search_count" }, opts = { skip = true } },
			-- Hide written message
			{ filter = { event = "msg_show", kind = "" }, opts = { skip = true } },
		},
	},
}
