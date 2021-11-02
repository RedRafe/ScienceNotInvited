data:extend({
  --- Vanilla settings
  {
    type          = "bool-setting",
    name          = "automation-science-pack", -- Red Science, must be enabled
    hidden        = true,
    default_value = true,
    forced_value  = true,
    setting_type  = "startup",
    order         = "AA-AA-S1"
  },
  {
    type          = "bool-setting",
    name          = "logistic-science-pack", -- Green Science
    hidden        = false,
    default_value = true,
    forced_value  = true,
    setting_type  = "startup",
    order         = "AA-AA-S2"
  },
  {
    type          = "bool-setting",
    name          = "military-science-pack", -- Black Science
    hidden        = false,
    default_value = true,
    forced_value  = true,
    setting_type  = "startup",
    order         = "AA-AA-S3"
  },
  {
    type          = "bool-setting",
    name          = "chemical-science-pack", -- Blue Science
    hidden        = false,
    default_value = true,
    forced_value  = true,
    setting_type  = "startup",
    order         = "AA-AA-S4"
  },
  {
    type          = "bool-setting",
    name          = "production-science-pack", -- Purple Science
    hidden        = false,
    default_value = true,
    forced_value  = true,
    setting_type  = "startup",
    order         = "AA-AA-S5"
  },
  {
    type          = "bool-setting",
    name          = "utility-science-pack", -- Yellow Science
    hidden        = false,
    default_value = true,
    forced_value  = true,
    setting_type  = "startup",
    order         = "AA-AA-S6"
  },
  {
    type          = "bool-setting",
    name          = "space-science-pack", -- White Science
    hidden        = false,
    default_value = true,
    forced_value  = true,
    setting_type  = "startup",
    order         = "AA-AA-S7"
  }
})

-- -- -- Compatibility settings
path_compatibility_scripts = "__science-not-invited__/" .. "compatibility/"

-- -- Space Exploration
if mods['space-exploration'] then
  require(path_compatibility_scripts .. "space-exploration/settings")
end

-- -- Bob's
if mods['bobmodules'] or mods['bobtech'] then
  require(path_compatibility_scripts .. "Bobs/settings")
end
