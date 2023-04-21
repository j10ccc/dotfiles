local status, bufferline = pcall(require, "bufferline")
if not status then
	vim.notify("没有找到 bufferline 捏👀")
	return
end

bufferline.setup({
	options = {
		-- 关闭 Tab 的命令，这里使用 moll/vim-bbye 的 :Bdelete 命令
		separator_style = {"", ""},
		show_close_icon = false,
		show_buffer_close_icons = false,
		close_command = "Bdelete! %d",
		right_mouse_command = "Bdelete! %d",
		offsets = {
			{
				filetype = "NvimTree",
				text = "这个点该下班啦",
				highlight = "Directory",
				text_align = "center",
			},
		},
    tab_size = 16,
		diagnostics = "nvim_lsp",

		diagnostics_indicator = function(_, _, diagnostics_dict, _)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and "E" or (e == "warning" and "W" or "H")
				s = s .. n .. sym
			end
			return s
		end,

	},
  highlights = {
    buffer_selected = {
      bold = true,
      italic = true
    },
    indicator_selected = {
      fg = "#ffffff"
    }
  }
})
