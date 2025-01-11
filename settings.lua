---------------------------------------------------------------------------
--                          VANILLA SETTINGS                             --
---------------------------------------------------------------------------
data:extend({
  --- Vanilla settings
  {
    type          = "bool-setting",
    name          = "allow-empty-tech-cost", -- Allow empty costs
    default_value = false,
    setting_type  = "startup",
    order         = "00-00-00",
  },
  {
    type          = "bool-setting",
    name          = "flat-remove", -- Just remove ingredients without redistributing the cost 
    default_value = false,
    setting_type  = "startup",
    order         = "00-01-00",
  },
  {
    type          = "bool-setting",
    name          = "automation-science-pack", -- Red Science
    hidden        = false,
    default_value = true,
    forced_value  = true,
    setting_type  = "startup",
    order         = "AA-AA-S01",
  },
  {
    type          = "bool-setting",
    name          = "logistic-science-pack", -- Green Science
    hidden        = false,
    default_value = true,
    forced_value  = true,
    setting_type  = "startup",
    order         = "AA-AA-S02",
  },
  {
    type          = "bool-setting",
    name          = "military-science-pack", -- Black Science
    hidden        = false,
    default_value = true,
    forced_value  = true,
    setting_type  = "startup",
    order         = "AA-AA-S03",
  },
  {
    type          = "bool-setting",
    name          = "chemical-science-pack", -- Blue Science
    hidden        = false,
    default_value = true,
    forced_value  = true,
    setting_type  = "startup",
    order         = "AA-AA-S04",
  },
  {
    type          = "bool-setting",
    name          = "production-science-pack", -- Purple Science
    hidden        = false,
    default_value = true,
    forced_value  = true,
    setting_type  = "startup",
    order         = "AA-AA-S05",
  },
  {
    type          = "bool-setting",
    name          = "utility-science-pack", -- Yellow Science
    hidden        = false,
    default_value = true,
    forced_value  = true,
    setting_type  = "startup",
    order         = "AA-AA-S06",
  },
  {
    type          = "bool-setting",
    name          = "space-science-pack", -- White Science
    hidden        = false,
    default_value = true,
    forced_value  = true,
    setting_type  = "startup",
    order         = "AA-AA-S07",
  }
})

---------------------------------------------------------------------------
--                       COMPATIBILITY SETTINGS                          --
---------------------------------------------------------------------------
local path_compatibility_scripts = "__science-not-invited__/" .. "compatibility/"

-- -- Space Age
require(path_compatibility_scripts .. "space-age/settings")

-- -- Angel's
require(path_compatibility_scripts .. "Angels/settings")

-- -- Bob's
require(path_compatibility_scripts .. "Bobs/settings")

-- -- Darkstar
require(path_compatibility_scripts .. "Darkstar/settings")

-- -- Krastorio2
require(path_compatibility_scripts .. "Krastorio2/settings")

-- -- StarsWithSakura
require(path_compatibility_scripts .. "StarsWithSakura/settings")

-- -- Space Exploration
require(path_compatibility_scripts .. "space-exploration/settings")

-- -- K2+SE
require(path_compatibility_scripts .. "K2SE/settings")

-- -- Exotic Industries
require(path_compatibility_scripts .. "exotic-industries/settings")
---------------------------------------------------------------------------