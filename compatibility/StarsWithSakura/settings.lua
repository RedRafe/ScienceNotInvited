if mods['StarsWithSakura'] then

data:extend({
  -- K2 extended science packs
  {
    type           = "bool-setting",
    name           = "inspiration",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-AA-S1"
  },
  {
    type           = "bool-setting",
    name           = "sakura-science-pack",
    default_value  = true,
    setting_type   = "startup",
    order          = "AA-AA-S2"
  },
})

end