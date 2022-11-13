-- local colorscheme = "solarized-flat"
local colorscheme = "neosolarized"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify(" 没有找到主题 " .. colorscheme .. " 捏👀")
  return
end
