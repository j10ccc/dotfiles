local status, hop = pcall(require, "hop")
if not status then
	vim.notify("没有找到 hop 捏👀")
	return
end

hop.setup({
  keys = "etovxqpdygfblzhckisuran"
})

vim.keymap.set("", "f", function()
  hop.hint_char1({ current_line_only = true })
end, {remap=true})

vim.keymap.set("", "<leader>w", function()
  hop.hint_words()
end, {remap=true})
