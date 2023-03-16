if mods['space-exploration'] then

  data:extend({
    --- Space Exploration settings
    {
      type           = "int-setting",
      name           = "space-exploration-pack",
      default_value  = 4,
      setting_type   = "startup",
      order          = "SE-TE-AA",
      allowed_values = {0, 1, 2, 3, 4}
    },
    {
      type           = "bool-setting",
      name           = "se-rocket-science-pack",
      default_value  = true,
      setting_type   = "startup",
      order          = "SE-SE-S1"
    },
    {
      type           = "bool-setting",
      name           = "se-astronomic-science-pack",
      default_value  = true,
      setting_type   = "startup",
      order          = "SE-SE-S2"
    },
    {
      type           = "bool-setting",
      name           = "se-biological-science-pack",
      default_value  = true,
      setting_type   = "startup",
      order          = "SE-SE-S3"
    },
    {
      type           = "bool-setting",
      name           = "se-energy-science-pack",
      default_value  = true,
      setting_type   = "startup",
      order          = "SE-SE-S4"
    },
    {
      type           = "bool-setting",
      name           = "se-material-science-pack",
      default_value  = true,
      setting_type   = "startup",
      order          = "SE-SE-S5"
    },
    {
      type           = "bool-setting",
      name           = "se-deep-space-science-pack",
      default_value  = true,
      setting_type   = "startup",
      order          = "SE-SE-S6"
    }
  })

end