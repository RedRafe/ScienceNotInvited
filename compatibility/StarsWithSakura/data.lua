local startup = require(path_public_lib .. "utils").startup

local Sakura = {}

Sakura.values = {
  ["inspiration"]         =  1.0,
  ["sakura-science-pack"] = 50.0,
}

Sakura.weights = {
  ["inspiration"]         = startup("inspiration"),
  ["sakura-science-pack"] = startup("sakura-science-pack"),
}

return Sakura