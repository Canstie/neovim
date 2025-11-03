return {
	"mason-org/mason.nvim",
	event = "VeryLazy",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mason-org/mason-lspconfig.nvim",
		"nvimtools/none-ls.nvim", -- 添加依赖
	},
	opts = {},
	config = function(_, opts)
		require("mason").setup(opts)
		local registry = require("mason-registry")
		local function setup(name, config)
			local success, package = pcall(registry.get_package, name)
			if success and not package:is_installed() then
				package:install()
			end
			local nvim_lsp = require("mason-lspconfig").get_mappings().package_to_lspconfig[name]
			config.capabilities = require("blink.cmp").get_lsp_capabilities()
			-- 更强制的禁用格式化方法
			config.on_attach = function(client)
				-- 完全禁用 LSP 的格式化功能
				if client.server_capabilities then
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end
			end
			vim.lsp.config(nvim_lsp, config)
			vim.lsp.enable(nvim_lsp)
		end
		local servers = {
			["lua-language-server"] = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						-- 在 LSP 层面也禁用格式化
						format = {
							enable = false,
						},
					},
				},
			},
			pyright = {},
			["html-lsp"] = {},
			["css-lsp"] = {},
			["typescript-language-server"] = {},
			["emmet-ls"] = {},
			gopls = {},
		}
		for server, config in pairs(servers) do
			setup(server, config)
		end
		vim.diagnostic.config({
			virtual_text = true,
			update_in_insert = true,
		})
		local function is_supported_filetype()
			local filetype = vim.bo.filetype
			local supported_filetype = {
				lua = "lua-language-server",
				python = "pyright",
				html = "html-lsp",
				css = "css-lsp",
				js = "typescript-language-server",
				go = "gopls",
			}
			return supported_filetype[filetype] ~= nil
		end
		if vim.fn.argc() > 0 and is_supported_filetype() then
			vim.cmd("LspStart")
		end
	end,
}
