local wezterm = require "wezterm"
local use_builtin_color_scheme = require "utils.use_builtin_color_scheme"
local theme = require "theme"

local module = {}

function module.set_process_name(s)
  return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

local function mount_event()
  local colors = use_builtin_color_scheme(theme.name)

  local tab_color_scheme = {
    default = {
      bg = colors.background,
      fg = colors.brights.grey
    },
    is_active = {
      bg = colors.brights.fuchsia,
      fg = colors.brights.white
    }
  }

  wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local bar_background = tab_color_scheme.default.bg
    local background = tab_color_scheme.default.bg
    local foreground = tab_color_scheme.default.fg

    if tab.is_active then
      background = tab_color_scheme.is_active.bg
      foreground = tab_color_scheme.is_active.fg
    end

    local title = module.set_process_name(tab.active_pane.foreground_process_name)
    title = wezterm.truncate_right(title, max_width - 6)

    return {
      { Background = { Color = bar_background } }, { Foreground = { Color = foreground } },
      { Text = wezterm.nerdfonts.ple_left_half_circle_thick },

      { Attribute = { Intensity = tab.is_active and "Bold" or "Normal" } },
      { Attribute = { Italic = not tab.is_active } },
      { Background = { Color = foreground } }, { Foreground = { Color = background } },
      { Text = tab.tab_index + 1 .. " " },

      { Background = { Color = background } }, { Foreground = { Color = foreground } },
      { Text = " " .. title .. " " },

      { Background = { Color = tab_color_scheme.default.bg } }, { Foreground = { Color = background } },
      { Text = wezterm.nerdfonts.ple_right_half_circle_thick },

      { Background = { Color = tab_color_scheme.default.bg } },
      { Text = " " }
    }
  end)
end

function module.apply_to_config(config)
  config.use_fancy_tab_bar = false
  config.tab_bar_at_bottom = true
  config.show_tab_index_in_tab_bar = false
  config.show_new_tab_button_in_tab_bar = false

  if config.colors == nil then
    config.colors = {}
  end

  local colors = use_builtin_color_scheme(theme.name)
  config.colors.tab_bar = {
    background = colors.background
  }

  mount_event()
end

return module
