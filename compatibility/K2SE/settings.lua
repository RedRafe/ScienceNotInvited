if mods['Krastorio2'] and mods['space-exploration'] then

  data.raw["bool-setting"]["se-rocket-science-pack"].order = "AA-AA-S45"
  data.raw["bool-setting"]["matter-tech-card"].order = "SE-SE-S7"

  data:extend({
    {
      type           = "bool-setting",
      name           = "kr-optimization-tech-card",
      default_value  = true,
      setting_type   = "startup",
      order          = "KK-K2-S2"
    },
    {
      type           = "bool-setting",
      name           = "se-kr-matter-science-pack-2",
      default_value  = true,
      setting_type   = "startup",
      order          = "SE-SE-S8"
    },
  })
end