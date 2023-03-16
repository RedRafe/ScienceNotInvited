local startup = require(path_public_lib .. "utils").startup

local Krastorio2 = {}

Krastorio2.values = {
  -- Basic science
  ["automation-science-pack"] =    1.8,
  ["logistic-science-pack"]   =    6.7,
  ["military-science-pack"]   =   12.7,
  ["chemical-science-pack"]   =   34.2,
  ["production-science-pack"] =  110.0,
  ["utility-science-pack"]    =  140.0,
  ["space-science-pack"]      =  600.0,
  -- Krastorio extended science packs
  ["basic-tech-card"]         =    2.0,
  ["matter-tech-card"]        =  110.0,
  ["advanced-tech-card"]      =  115.0,
  ["singularity-tech-card"]   = 2400.0
}

Krastorio2.weights = {
  -- Krastorio extended science packs
  ["basic-tech-card"]         = startup("basic-tech-card"),
  ["matter-tech-card"]        = startup("matter-tech-card"),
  ["advanced-tech-card"]      = startup("advanced-tech-card"),
  ["singularity-tech-card"]   = startup("singularity-tech-card")
}

return Krastorio2