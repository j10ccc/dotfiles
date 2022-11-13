local status, neosolarized = pcall(require, "neosolarized")
if (not status) then return end

neosolarized.setup({
  comment_italics = true,
})
local cb = require('colorbuddy.init')

local Color = cb.Color
local colors = cb.colors
local Group = cb.Group
local styles = cb.styles

-- Color.new("black", "#000000")
Group.new('CursorLine', colors.none, colors.base03, styles.NONE, colors.base1)
Group.new('CursorLineNr', colors.yellow, colors.none, styles.NONE, colors.base1)
Group.new('Visual', colors.none, colors.base03, styles.reverse)
Group.new('Comment', colors.base01, colors.none, styles.nocombine)

