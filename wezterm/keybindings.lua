local wezterm = require "wezterm";

local module = {};

local emitKey = function(key, mods)
  return {
    key = key,
    mods = mods,
    action = wezterm.action.SendKey({ key = key, mods = mods }),
  }
end

function module.apply_to_config(config)
  config.keys = {
    emitKey("-", "CTRL"),
    emitKey("=", "CTRL")
  }
end;

return module;
