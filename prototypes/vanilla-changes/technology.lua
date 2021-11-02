-- Import modules
SNI = require(path_private_lib .. 'technology')

-- Table of values per science packs based on raw resources
local values = {
  ["automation-science-pack"] =   3.0, -- Red science
  ["logistic-science-pack"]   =   7.5, -- Green science
  ["military-science-pack"]   =  25.5, -- Black science
  ["chemical-science-pack"]   =  58.5, -- Blue science
  ["production-science-pack"] = 153.5, -- Purple science
  ["utility-science-pack"]    = 193.0, -- Yellow science
  ["space-science-pack"]      = 545.5  -- Space science
}

local weights = {}

for key, _ in pairs(values) do
  weights[key] = settings.startup[key].value and 1 or 0
end

SNI.setWeights(weights)
SNI.setValues(values)
