return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		explorer = { enabled = false }, -- ❌ 禁用 explorer，用 nvim-tree
		indent = {
			enabled = true,
			indent = {
				only_scope = true,
			},
		},
		terminal = { enabled = true },
		input = { enabled = true },
		notifier = {
			enabled = true,
			timeout = 3000,
			style = "notification",
		},
		picker = {
			enabled = false,
		},
		quickfile = { enabled = true },
		scope = {
			enabled = true,
		},
		scroll = {
			enabled = true,
			smooth = true,
			easing = "in_out_cubic",
		},
		statuscolumn = { enabled = true },
		words = { enabled = true },
		lazygit = {
			enabled = true,
			configure = false,
		},
		styles = {
			terminal = {
				relative = "editor",
				border = "rounded",
				position = "float",
				backdrop = 60,
				height = 0.9,
				width = 0.9,
				zindex = 50,
			},
		},
	},
	keys = {
		-- snacks terminal
		{ "<leader>g", group = "Git" },
		{
			"<leader>gg",
			function()
				require("snacks").lazygit()
			end,
			desc = "Open LazyGit",
		},
		{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Git Status" },
		{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Git Commits" },
		{ "<leader>gb", "<cmd>Telescope git_branches<CR>", desc = "Git Branches" },
		{
			"<A-i>",
			function()
				require("snacks").terminal()
			end,
			desc = "[Snacks] Toggle terminal",
		},
		-- snacks notifier
		{
			"<leader>un",
			function()
				require("snacks").notifier.hide()
			end,
			desc = "[Snacks] Dismiss all notification",
		},
		{
			'<leader>s"',
			function()
				require("snacks").picker.registers()
			end,
			desc = "[Snacks] 寄存器（Registers）",
		},
		{
			"<leader>s/",
			function()
				require("snacks").picker.search_history()
			end,
			desc = "[Snacks] 搜索历史",
		},
		{
			"<leader>sa",
			function()
				require("snacks").picker.spelling()
			end,
			desc = "[Snacks] 拼写建议",
		},
		{
			"<leader>sA",
			function()
				require("snacks").picker.autocmds()
			end,
			desc = "[Snacks] 自动命令 (autocmds)",
		},
		{
			"<leader>s:",
			function()
				require("snacks").picker.command_history()
			end,
			desc = "[Snacks] 命令历史",
		},
		{
			"<leader>sc",
			function()
				require("snacks").picker.commands()
			end,
			desc = "[Snacks] 可用命令列表",
		},
		{
			"<leader>sd",
			function()
				require("snacks").picker.diagnostics()
			end,
			desc = "[Snacks] 全局诊断信息",
		},
		{
			"<leader>sD",
			function()
				require("snacks").picker.diagnostics_buffer()
			end,
			desc = "[Snacks] 当前缓冲区诊断信息",
		},
		{
			"<leader>sH",
			function()
				require("snacks").picker.help()
			end,
			desc = "[Snacks] 帮助文档",
		},
		{
			"<leader>sh",
			function()
				require("snacks").picker.highlights()
			end,
			desc = "[Snacks] 高亮组",
		},
		{
			"<leader>sI",
			function()
				require("snacks").picker.icons()
			end,
			desc = "[Snacks] 图标预览",
		},
		{
			"<leader>sj",
			function()
				require("snacks").picker.jumps()
			end,
			desc = "[Snacks] 跳转记录 (Jumps)",
		},
		{
			"<leader>sk",
			function()
				require("snacks").picker.keymaps()
			end,
			desc = "[Snacks] 键位映射列表",
		},
		{
			"<leader>sl",
			function()
				require("snacks").picker.loclist()
			end,
			desc = "[Snacks] 位置列表 (Location List)",
		},
		{
			"<leader>sm",
			function()
				require("snacks").picker.marks()
			end,
			desc = "[Snacks] 标记 (Marks)",
		},
		{
			"<leader>sM",
			function()
				require("snacks").picker.man()
			end,
			desc = "[Snacks] Man 手册页",
		},
		{
			"<leader>sp",
			function()
				require("snacks").picker.lazy()
			end,
			desc = "[Snacks] 查找插件定义 (Lazy.nvim)",
		},
		{
			"<leader>sq",
			function()
				require("snacks").picker.qflist()
			end,
			desc = "[Snacks] Quickfix 列表",
		},
		{
			"<leader>sr",
			function()
				require("snacks").picker.resume()
			end,
			desc = "[Snacks] 恢复上次 Picker 会话",
		},
	},
	init = function()
		local Snacks = require("snacks")
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Setup some globals for debugging (lazy-loaded)
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end
				vim.print = _G.dd -- Override print to use snacks for `:=` command

				Snacks.toggle
					.new({
						id = "Animation",
						name = "Animation",
						get = function()
							return Snacks.animate.enabled()
						end,
						set = function(state)
							vim.g.snacks_animate = state
						end,
					})
					:map("<leader>ta")

				Snacks.toggle
					.new({
						id = "scroll_anima",
						name = "Scroll animation",
						get = function()
							return Snacks.scroll.enabled
						end,
						set = function(state)
							if state then
								Snacks.scroll.enable()
							else
								Snacks.scroll.disable()
							end
						end,
					})
					:map("<leader>tS")

				-- Create some toggle mappings
				Snacks.toggle.dim():map("<leader>tD")

				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>ts")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>tw")
				Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>tL")
				Snacks.toggle.diagnostics():map("<leader>td")
				Snacks.toggle.line_number():map("<leader>tl")
				Snacks.toggle
					.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
					:map("<leader>tc")
				Snacks.toggle.treesitter():map("<leader>tT")
				Snacks.toggle
					.option("background", { off = "light", on = "dark", name = "Dark Background" })
					:map("<leader>tb")
				Snacks.toggle.inlay_hints():map("<leader>th")
				Snacks.toggle.indent():map("<leader>tg")
				Snacks.toggle.dim():map("<leader>tD")
				-- Toggle the profiler
				Snacks.toggle.profiler():map("<leader>tpp")
				-- Toggle the profiler highlights
				Snacks.toggle.profiler_highlights():map("<leader>tph")

				vim.keymap.del("n", "grn")
				vim.keymap.del("n", "gra")
				vim.keymap.del("n", "grr")
				vim.keymap.del("n", "gri")

				vim.api.nvim_set_hl(0, "SnacksPickerListCursorLine", { bg = "#313244" })
			end,
		})
	end,
}
