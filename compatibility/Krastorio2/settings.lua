if mods['Krastorio2'] then

data:extend({
  -- K2 extended science packs
  {
    type           = "bool-setting",
    name           = "basic-tech-card",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-AA-K1"
  },
  {
    type           = "bool-setting",
    name           = "matter-tech-card",
    default_value  = true,
    setting_type   = "startup",
    order          = "KK-K2-S2"
  },
  {
    type           = "bool-setting",
    name           = "advanced-tech-card",
    default_value  = true,
    setting_type   = "startup",
    order          = "KK-K2-S3"
  },
  {
    type           = "bool-setting",
    name           = "singularity-tech-card",
    default_value  = true,
    setting_type   = "startup",
    order          = "KK-K2-S4"
  }
})

end