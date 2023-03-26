local status, colorizer = pcall(require, "colorizer")
if not status then
	vim.notify("没有找到 colorizer 捏👀")
	return
end

colorizer.setup()
