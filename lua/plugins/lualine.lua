return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",

	opts = function()
		-- 🕒 当前时间
		local function get_time()
			return "🕒 " .. os.date("%H:%M")
		end

		return {
			options = {
				theme = "tokyonight",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
			},
			extensions = { "nvim-tree" },
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = {
					"filesize",
					"encoding",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = {
					get_time,
					"location",
				},
			},
		}
	end,
}
