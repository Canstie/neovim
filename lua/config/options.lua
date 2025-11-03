-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
if vim.g.neovide then
	-- 字体
	vim.o.guifont = "CaskaydiaCove Nerd Font:h17" -- 稍微调小一点更协调
	-- 缩放
	vim.g.neovide_scale_factor = 0.95
	local change_scale_factor = function(delta)
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
	end
	vim.keymap.set("n", "<C-=>", function()
		change_scale_factor(1.1)
	end)
	vim.keymap.set("n", "<C-->", function()
		change_scale_factor(1 / 1.1)
	end)
	-- 透明度和外观
	vim.g.neovide_opacity = 0.85
	vim.g.neovide_frame = "none"
	-- 动画
	vim.g.neovide_cursor_vfx_mode = "pixiedust"
	vim.g.neovide_cursor_vfx_opacity = 200.0
	vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
	vim.g.neovide_cursor_vfx_particle_density = 10.0
	vim.g.neovide_cursor_vfx_particle_speed = 15.0
	vim.g.neovide_cursor_vfx_particle_phase = 1.5
	vim.g.neovide_cursor_vfx_particle_curl = 1.0
	-- 禁用插件动画（防止冲突）
	vim.g.snacks_animate = false
end
