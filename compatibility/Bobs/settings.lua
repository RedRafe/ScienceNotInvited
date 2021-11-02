log('Loading bob settings')

data:extend({
  -- -- Basic science
  {
    type           = "bool-setting",
    name           = "advanced-logistic-science-pack",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-BA-S1"
  },
  {
    type           = "bool-setting",
    name           = "science-pack-gold",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-BA-S2"
  },
  -- -- Alien science
  {
    type           = "bool-setting",
    name           = "alien-science",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-BB-A0"
  },
  {
    type           = "bool-setting",
    name           = "alien-science-pack",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-BB-A1"
  },
  {
    type           = "bool-setting",
    name           = "alien-science-pack-blue",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-BB-A2"
  },
  {
    type           = "bool-setting",
    name           = "alien-science-pack-orange",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-BB-A3"
  },
  {
    type           = "bool-setting",
    name           = "alien-science-pack-purple",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-BB-A4"
  },
  {
    type           = "bool-setting",
    name           = "alien-science-pack-yellow",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-BB-A5"
  },
  {
    type           = "bool-setting",
    name           = "alien-science-pack-green",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-BB-A6"
  },
  {
    type           = "bool-setting",
    name           = "alien-science-pack-red",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-BB-A7"
  },
  -- -- Module science
  {
    type           = "bool-setting",
    name           = "module-science",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-BB-D0-1"
  },
  {
    type           = "int-setting",
    name           = "module-science-tier",
    default_value  = 3,
    setting_type   = "startup",
    order          = "AA-BB-D0-2",
    allowed_values = {0, 1, 2, 3}
  },
  {
    type           = "bool-setting",
    name           = "module-case",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-BB-D1"
  },
  {
    type           = "bool-setting",
    name           = "module-circuit-board",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-BB-D2"
  },
  {
    type           = "bool-setting",
    name           = "speed-processor",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-BB-M1"
  },
  {
    type           = "bool-setting",
    name           = "effectivity-processor",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-BB-M2"
  },
  {
    type           = "bool-setting",
    name           = "productivity-processor",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-BB-M3"
  },
  {
    type           = "bool-setting",
    name           = "pollution-clean-processor",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-BB-M4"
  },
  {
    type           = "bool-setting",
    name           = "pollution-create-processor",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-BB-M5"
  }
})