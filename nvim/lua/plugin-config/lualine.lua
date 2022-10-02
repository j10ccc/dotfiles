local status, lualine = pcall(require, "lualine")

if not status then
    vim.notify("没有找到 lualine 捏👀")
  return
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "solarized_dark",
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    -- https://github.com/ryanoasis/powerline-extra-symbols
    -- section_separators = { left = " ", right = "" },
  },
  extensions = { "nvim-tree", "toggleterm" },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = {
      "filename",
      {
        "lsp_progress",
        spinner_symbols = { " ", " ", " ", " ", " ", " " },
      },
    },
    lualine_x = {
      "filesize",
      {
        "fileformat",
        symbols = {
          unix = "LF",
          dos = "CRLF",
          mac = "CR",
        },
      },
    },
		lualine_y = { },
		lualine_z = { 'location' }
  },
	inactive_section = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{
      'filename',
			file_status = true,
			path = 1
		}},
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
	}
})
