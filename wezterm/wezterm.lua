local wezterm = require "wezterm";
local font = require "font";
local theme = require "theme";
local keybindings = require "keybindings";
local misc = require "misc";
local tab_bar = require "appearance.tab_bar";
local right_staus = require "appearance.right-status";

local config = wezterm.config_builder();

font.apply_to_config(config);
theme.apply_to_config(config);
keybindings.apply_to_config(config);
misc.apply_to_config(config);
tab_bar.apply_to_config(config);
right_staus.apply_to_config(config);

return config;
