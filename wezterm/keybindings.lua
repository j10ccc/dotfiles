local wezterm = require "wezterm";

local module = {};

local for_zellij = {
  mods = "CMD",
  key = "w",
  action = wezterm.action_callback(
    function(window, _)
      window.perform_action({ SendKey = { key = "w", mods = "CMD" }})
    end
  )
};

function module.apply_to_config(config)
  config.keys = { for_zellij };
end;

return module;
