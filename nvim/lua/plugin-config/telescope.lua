local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("没有找到 telescope 捏👀")
  return
end

telescope.setup({
  defaults = {
    initial_mode = "insert",
    mappings = require("keybindings").telescopeList,
  },
  pickers = {
    find_files = {
      -- 查找文件换皮肤，支持的参数有： dropdown, cursor, ivy
			-- theme = ""
    }
  },
  extensions = {
     -- 扩展插件配置
  },
})
