-- See scheme fields in https://wezfurlong.org/wezterm/config/appearance.html#defining-your-own-colors
local use_builtin_color_scheme = function(theme_name)
  local theme = require('wezterm').get_builtin_color_schemes()[theme_name]
  -- require("wezterm").log_info(theme.ansi)

  return {
    foreground = theme.foreground,
    background = theme.background,
    ansi = {
      black = theme.ansi[1],
      maroon = theme.ansi[2],
      green = theme.ansi[3],
      olive = theme.ansi[4],
      navy = theme.ansi[5],
      purple = theme.ansi[6],
      teal = theme.ansi[7],
      silver = theme.ansi[8]
    },
    brights = {
      grey = theme.brights[1],
      red = theme.brights[2],
      lime = theme.brights[3],
      yellow = theme.brights[4],
      blue = theme.brights[5],
      fuchsia = theme.brights[6],
      aqua = theme.brights[7],
      white = theme.brights[8],
    }
  }
end

return use_builtin_color_scheme
