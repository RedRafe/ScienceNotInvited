local startup = require(path_public_lib .. "utils").startup

local SpaceAge = {}

SpaceAge.values = {
  -- Vanilla rebalance
  ["space-science-pack"]           =  215.0,
  -- Space Age extended science packs
  ["metallurgic-science-pack"]     =  300.0,
  ["electromagnetic-science-pack"] =  350.0,
  ["agricultural-science-pack"]    =  400.0,
  ["cryogenic-science-pack"]       =  800.0,
  ["promethium-science-pack"]      = 1000.0,
}

SpaceAge.weights = {
  -- Space Age extended science packs
  ["metallurgic-science-pack"]     = startup("metallurgic-science-pack"),
  ["electromagnetic-science-pack"] = startup("electromagnetic-science-pack"),
  ["agricultural-science-pack"]    = startup("agricultural-science-pack"),
  ["cryogenic-science-pack"]       = startup("cryogenic-science-pack"),
  ["promethium-science-pack"]      = startup("promethium-science-pack"),
}

return SpaceAge