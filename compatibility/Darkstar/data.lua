local startup = require(path_public_lib .. "utils").startup

local Darkstar = {}

Darkstar.values = {
  ["neural-science-pack"] = 1325
}

Darkstar.weights = {
  ["neural-science-pack"] = startup("neural-science-pack"),
}

return Darkstar