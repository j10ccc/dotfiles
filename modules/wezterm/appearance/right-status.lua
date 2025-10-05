local wezterm = require "wezterm"
local theme = require "theme"
local use_builtin_color_scheme = require "utils.use_builtin_color_scheme"

local module = {}

module.brand_emoji = "🍜"

local mount_event = function()
  wezterm.on("update-right-status", function(window, pane)
    local weekday = wezterm.strftime "%a"
    local date = wezterm.strftime "%b %d %H:%M"
    local colors = use_builtin_color_scheme(theme.name)

    window:set_right_status(wezterm.format {
      { Foreground = { Color = colors.brights.grey } },
      { Background = { Color = colors.background } },
      { Text = wezterm.nerdfonts.ple_left_half_circle_thick },

      { Foreground = { Color = colors.ansi.silver } },
      { Background = { Color = colors.brights.grey } },
      { Text = " " .. module.brand_emoji .. " " },

      { Foreground = { Color = colors.brights.grey } },
      { Background = { Color = colors.ansi.black } },
      { Text = wezterm.nerdfonts.ple_right_half_circle_thick },

      { Attribute = { Intensity = "Bold" } },
      { Foreground = { Color = colors.ansi.green } },
      { Background = { Color = colors.ansi.black } },
      { Text = " " .. weekday .. " " },

      { Attribute = { Intensity = "Normal" } },
      { Attribute = { Italic = true } },
      { Foreground = { Color = colors.ansi.silver } },
      { Background = { Color = colors.ansi.black } },
      { Text = date .. " " },

      { Foreground = { Color = colors.ansi.black } },
      { Background = { Color = colors.background } },
      { Text = wezterm.nerdfonts.ple_right_half_circle_thick },
    })
  end)
end

function module.apply_to_config(config)
  mount_event()
end

return module
