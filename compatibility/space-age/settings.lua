if mods['space-age'] then

data:extend({
  -- SA extended science packs
  {
    type           = "bool-setting",
    name           = "metallurgic-science-pack",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-AA-S08",
  },
  {
    type           = "bool-setting",
    name           = "electromagnetic-science-pack",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-AA-S09",
  },
  {
    type           = "bool-setting",
    name           = "agricultural-science-pack",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-AA-S10",
  },
  {
    type           = "bool-setting",
    name           = "cryogenic-science-pack",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-AA-S11",
  },
  {
    type           = "bool-setting",
    name           = "promethium-science-pack",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-AA-S12",
  },
})

end