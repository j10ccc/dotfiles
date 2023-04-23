local status, tc = pcall(require, "todo-comments")
if not status then
	vim.notify("没有找到 todo-comments 捏👀")
	return
end

tc.setup()
