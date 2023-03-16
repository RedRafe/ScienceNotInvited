local startup = require(path_public_lib .. "utils").startup

local K2SE = {}

K2SE.values = {
  -- Basic science
  ["automation-science-pack"]       =    3.6, -- Red science
  ["logistic-science-pack"]         =    9.2, -- Green science
  ["military-science-pack"]         =   12.7, -- Black science
  ["chemical-science-pack"]         =   39.2, -- Blue science
  ["production-science-pack"]       =  126.5, -- Purple science
  ["utility-science-pack"]          =  250.0, -- Yellow science
  ["space-science-pack"]            =  455.0, -- Space science
  -- Inherited from K2 and SE
  ["basic-tech-card"]               =    2.0, --
  ["matter-tech-card"]              = 2000.0, --
  ["advanced-tech-card"]            =  150.0, --
  ["kr-optimization-tech-card"]     =  150.0, --
  ["singularity-tech-card"]         = 8000.0, --                             
  ["se-rocket-science-pack"]        =  125.0, --
  ["se-kr-matter-science-pack-2"]   = 3000.0, --
}

K2SE.weights = {
  ["kr-optimization-tech-card"]   = startup("kr-optimization-tech-card"),
  ["se-kr-matter-science-pack-2"] = startup("se-kr-matter-science-pack-2"),
}

return K2SE