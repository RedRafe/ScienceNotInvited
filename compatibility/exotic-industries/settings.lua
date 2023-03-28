if not mods['exotic-industries'] then return end

data:extend({
  -- EI science packs
  {
    type           = "bool-setting",
    name           = "ei_dark-age-tech",
    default_value  = true,
    setting_type   = "startup",
    order          = "EI-AA-S01"
  },
  {
    type           = "bool-setting",
    name           = "ei_steam-age-tech",
    default_value  = true,
    setting_type   = "startup",
    order          = "EI-AA-S02"
  },
  {
    type           = "bool-setting",
    name           = "ei_electricity-age-tech",
    default_value  = true,
    setting_type   = "startup",
    order          = "EI-AA-S03"
  },
  {
    type           = "bool-setting",
    name           = "ei_computer-age-tech",
    default_value  = true,
    setting_type   = "startup",
    order          = "EI-AA-S04"
  },
  {
    type           = "bool-setting",
    name           = "ei_advanced-computer-age-tech",
    default_value  = true,
    setting_type   = "startup",
    order          = "EI-AA-S05"
  },
  {
    type           = "bool-setting",
    name           = "ei_quantum-age-tech",
    default_value  = true,
    setting_type   = "startup",
    order          = "EI-AA-S06"
  },
  {
    type           = "bool-setting",
    name           = "ei_fusion-quantum-age-tech",
    default_value  = true,
    setting_type   = "startup",
    order          = "EI-AA-S07"
  },
  {
    type           = "bool-setting",
    name           = "ei_space-quantum-age-tech",
    default_value  = true,
    setting_type   = "startup",
    order          = "EI-AA-S08"
  },
  {
    type           = "bool-setting",
    name           = "ei_exotic-age-tech",
    default_value  = true,
    setting_type   = "startup",
    order          = "EI-AA-S09"
  },
  {
    type           = "bool-setting",
    name           = "ei_black-hole-exotic-age-tech",
    default_value  = true,
    setting_type   = "startup",
    order          = "EI-AA-S10"
  },
})
  

for _, name in pairs({
  "automation-science-pack",
  "logistic-science-pack",
  "military-science-pack",
  "chemical-science-pack",
  "production-science-pack",
  "utility-science-pack",
  "space-science-pack"
}) do
  data.raw["bool-setting"][name].forced_value = false
  data.raw["bool-setting"][name].hidden = true
end