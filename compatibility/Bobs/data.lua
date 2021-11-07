local Bobs = {}

local RAW_ALIEN = 10

local function startup(key)
  return settings.startup[key].value and 1 or 0
end

local function letTier(value)
  return (value <= settings.startup["module-science-tier"].value) and 1 or 0
end

Bobs.values = {
  -- Basic science
  ["automation-science-pack"]        =   3.0,
  ["logistic-science-pack"]          =   6.5,
  ["military-science-pack"]          =  22.5,
  ["chemical-science-pack"]          =  37.4,
  ["advanced-logistic-science-pack"] =  99.0,
  ["production-science-pack"]        =  85.5,
  ["utility-science-pack"]           = 138.0,
  ["science-pack-gold"]              =  69.5,
  ["space-science-pack"]             = 199.0,
  -- Alien science
  ["alien-science-pack"]             = 2.5 * RAW_ALIEN,
  ["alien-science-pack-blue"]        = 2.5 * RAW_ALIEN,
  ["alien-science-pack-orange"]      = 2.5 * RAW_ALIEN,
  ["alien-science-pack-purple"]      = 2.5 * RAW_ALIEN,
  ["alien-science-pack-yellow"]      = 2.5 * RAW_ALIEN,
  ["alien-science-pack-green"]       = 2.5 * RAW_ALIEN,
  ["alien-science-pack-red"]         = 2.5 * RAW_ALIEN,
  -- Module science
  ["module-case"]                    = 26.2,
  ["module-contact"]                 =  0.4,
  ["module-circuit-board"]           =  9.6,
  ["module-processor-board"]         =  2.3,
  ["module-processor-board-2"]       =  7.5,
  ["module-processor-board-3"]       =  2.5,
  ["speed-processor"]                =  9.5,
  ["speed-processor-2"]              = 21.0,
  ["speed-processor-3"]              = 14.5,
  ["effectivity-processor"]          =  9.5,
  ["effectivity-processor-2"]        = 21.0,
  ["effectivity-processor-3"]        = 14.5,
  ["productivity-processor"]         =  9.5,
  ["productivity-processor-2"]       = 21.0,
  ["productivity-processor-3"]       = 14.5,
  ["pollution-clean-processor"]      =  9.5,
  ["pollution-clean-processor-2"]    = 21.0,
  ["pollution-clean-processor-3"]    = 14.5,
  ["pollution-create-processor"]     =  9.5,
  ["pollution-create-processor-2"]   = 21.0,
  ["pollution-create-processor-3"]   = 14.5
}

Bobs.weights = {
  -- Basic science
  ["advanced-logistic-science-pack"] = startup("advanced-logistic-science-pack"),
  ["science-pack-gold"]              = startup("science-pack-gold"),
  -- Alien science
  ["alien-science-pack"]             = startup("alien-science") * startup("alien-science-pack"),
  ["alien-science-pack-blue"]        = startup("alien-science") * startup("alien-science-pack-blue"),
  ["alien-science-pack-orange"]      = startup("alien-science") * startup("alien-science-pack-orange"),
  ["alien-science-pack-purple"]      = startup("alien-science") * startup("alien-science-pack-purple"),
  ["alien-science-pack-yellow"]      = startup("alien-science") * startup("alien-science-pack-yellow"),
  ["alien-science-pack-green"]       = startup("alien-science") * startup("alien-science-pack-green"),
  ["alien-science-pack-red"]         = startup("alien-science") * startup("alien-science-pack-red"),
  -- Module science
  ["module-case"]                    = startup("module-science") * startup("module-case"),
  ["module-contact"]                 = startup("module-science"),
  ["module-circuit-board"]           = startup("module-science") * startup("module-circuit-board"),
  ["module-processor-board"]         = startup("module-science"),
  ["module-processor-board-2"]       = startup("module-science"),
  ["module-processor-board-3"]       = startup("module-science"),
  ["speed-processor"]                = startup("module-science") * letTier(1) * startup("speed-processor"),
  ["speed-processor-2"]              = startup("module-science") * letTier(2) * startup("speed-processor"),
  ["speed-processor-3"]              = startup("module-science") * letTier(3) * startup("speed-processor"),
  ["effectivity-processor"]          = startup("module-science") * letTier(1) * startup("effectivity-processor"),
  ["effectivity-processor-2"]        = startup("module-science") * letTier(2) * startup("effectivity-processor"),
  ["effectivity-processor-3"]        = startup("module-science") * letTier(3) * startup("effectivity-processor"),
  ["productivity-processor"]         = startup("module-science") * letTier(1) * startup("productivity-processor"),
  ["productivity-processor-2"]       = startup("module-science") * letTier(2) * startup("productivity-processor"),
  ["productivity-processor-3"]       = startup("module-science") * letTier(3) * startup("productivity-processor"),
  ["pollution-clean-processor"]      = startup("module-science") * letTier(1) * startup("pollution-clean-processor"),
  ["pollution-clean-processor-2"]    = startup("module-science") * letTier(2) * startup("pollution-clean-processor"),
  ["pollution-clean-processor-3"]    = startup("module-science") * letTier(3) * startup("pollution-clean-processor"),
  ["pollution-create-processor"]     = startup("module-science") * letTier(1) * startup("pollution-create-processor"),
  ["pollution-create-processor-2"]   = startup("module-science") * letTier(2) * startup("pollution-create-processor"),
  ["pollution-create-processor-3"]   = startup("module-science") * letTier(3) * startup("pollution-create-processor")
}

return Bobs