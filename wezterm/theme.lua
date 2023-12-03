local module = {}

module.name = "nord"

function module.apply_to_config(config)
  config.color_scheme = module.name
end

return module
