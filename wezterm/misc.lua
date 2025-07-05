local wezterm = require "wezterm";
local module = {};

function module.apply_to_config(config)
  config.front_end = "WebGpu";
  config.default_prog = { '/run/current-system/sw/bin/fish', '-l' }
end;

return module;
