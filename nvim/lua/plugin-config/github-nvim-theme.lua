local status, github_theme = pcall(require, "github-theme")
if not status then
	vim.notify("没有找到 github-nvim-theme 捏👀")
	return
end

github_theme.setup({
  theme_style = "dimmed"
})
