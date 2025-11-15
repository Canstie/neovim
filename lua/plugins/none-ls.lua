-- 放在 lua/plugins/none-ls.lua
return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"mason-org/mason.nvim", -- 需要 mason 来安装工具
	},
	event = "VeryLazy",
	config = function()
		local registry = require("mason-registry")

		-- 自动安装 none-ls 需要的工具
		local function install(name)
			local success, package = pcall(registry.get_package, name)
			if success and not package:is_installed() then
				package:install()
			end
		end

		-- ######### 你需要安装的工具 #########
		install("stylua") --  Lua 格式化
		install("goimports") --  Go 格式化工具
		install("black")
		install("prettierd") -- JavaScript/TypeScript 格式化工具
		install("clang-format")
		-- ####################################

		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.prettierd,
				-- 【新增】Go 格式化
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.clang_format,
			},
		})
	end,
	keys = {
		{
			"<leader>lf",
			function()
				vim.lsp.buf.format({
					async = true,
				})
			end,
			desc = "Format buffer (null-ls)",
		},
	},
}
