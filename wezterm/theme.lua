local module = {};

local function init_tab_bar(config)
  config.enable_tab_bar = false;
end;

function module.apply_to_config(config)
  init_tab_bar(config);
  config.color_scheme = "nord";
end;

return module;
