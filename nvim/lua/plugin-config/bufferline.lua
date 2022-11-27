local status, bufferline = pcall(require, "bufferline")
if not status then
	vim.notify("没有找到 bufferline 捏👀")
	return
end

-- https://github.com/akinsho/bufferline.nvim#configuration
bufferline.setup({
	options = {
		-- 关闭 Tab 的命令，这里使用 moll/vim-bbye 的 :Bdelete 命令
		separator_style = "slant",
		show_close_icon = false,
		show_buffer_close_icons = false,
		close_command = "Bdelete! %d",
		right_mouse_command = "Bdelete! %d",
		-- 侧边栏配置
		-- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
		offsets = {
			{
				filetype = "NvimTree",
				text = "👴 的文件太多啦！",
				highlight = "Directory",
				text_align = "center",
			},
		},

		diagnostics = "nvim_lsp",
		-- 可选，显示 LSP 报错图标
		---@diagnostic disable-next-line: unused-local
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and "E" or (e == "warning" and "W " or "H")
				s = s .. n .. sym
			end
			return s
		end,
	},
	highlights = {
		separator = {
			fg = "#073642",
			-- bg = '#002b36',
		},
		separator_selected = {
			fg = "#073642",
			-- bg = '#002b36',
		},
		background = {
			fg = "#657b83",
			-- bg = '#002b36'
		},
		buffer_selected = {
			fg = "#fdf6e3",
			bold = true,
			italic = true,
		},
		fill = {
			bg = "#073642",
		},
	},
})
