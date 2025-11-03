return {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("colorizer").setup({
			filetypes = { "*" }, -- 所有文件都启用
			user_default_options = {
				RGB = true, -- #RGB 形式
				RRGGBB = true, -- #RRGGBB
				names = false, -- 不识别颜色名，如 "blue"
				RRGGBBAA = true, -- #RRGGBBAA
				rgb_fn = true, -- rgb() 形式
				hsl_fn = true, -- hsl() 形式
				css = true, -- 支持 css 语法
				css_fn = true, -- 支持 css 函数
				mode = "background", -- 'background' | 'foreground' | 'virtualtext'
			},
		})
	end,
}
