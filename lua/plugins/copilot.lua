return {
	{
		"zbirenbaum/copilot.lua",
		dependencies = {
			"copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
		},
		cmd = "Copilot",
		event = "VeryLazy",
		opts = {
			suggestion = { enabled = false },
			panle = { enabled = false },
			filetypes = {
				markdown = true,
				help = true,
			},
		},
	},
	{
		"olimorris/codecompanion.nvim",
		opts = {
			display = {
				diff = {
					enabled = true,
					provider = "mini_diff",
				},
			},
			strategies = {
				chat = {
					adapter = "copilot",
				},
				inline = {
					adapter = "copilot",
				},
			},
			opts = {
				language = "Chinese",
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		keys = {
			{
				"<leader>cca", -- 触发 CodeCompanionActions 的快捷键
				"<cmd>CodeCompanionActions<cr>", -- 执行 CodeCompanionActions 命令
				mode = { "n", "v" }, -- 在普通模式和可视模式下可用
				noremap = true, -- 不允许递归映射
				silent = true, -- 执行时不显示命令
				desc = "显示代码助手可用操作",
			},
			{
				"<leader>cci",
				"<cmd>CodeCompanion<cr>",
				mode = { "n", "v" },
				noremap = true,
				silent = true,
				desc = "使用代码助手生成或修改代码",
			},
			{
				"<leader>ccc",
				"<cmd>CodeCompanionChat Toggle<cr>",
				mode = { "n", "v" },
				noremap = true,
				silent = true,
				desc = "打开或关闭代码助手聊天窗口",
			},
			{
				"<leader>ccp",
				"<cmd>CodeCompanionChat Add<cr>",
				mode = { "v" },
				noremap = true,
				silent = true,
				desc = "将选中内容添加到聊天窗口",
			},
		},
	},
	{
		"nvim-mini/mini.diff",
		event = "VeryLazy",
		version = "*",
		opts = {},
	},
}
