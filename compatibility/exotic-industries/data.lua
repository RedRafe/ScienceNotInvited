local startup = require(path_public_lib .. "utils").startup

local EI = {}

EI.values = {
  ["ei_dark-age-tech"]              =    2,
  ["ei_steam-age-tech"]             =    4,
  ["ei_electricity-age-tech"]       =   25,
  ["ei_computer-age-tech"]          =  160,
  ["ei_advanced-computer-age-tech"] =  100,
  ["ei_quantum-age-tech"]           =  600,
  ["ei_fusion-quantum-age-tech"]    =  700,
  ["ei_space-quantum-age-tech"]     = 1000,
  ["ei_exotic-age-tech"]            = 1500,
  ["ei_black-hole-exotic-age-tech"] =  500,
  
}

EI.weights = {
  ["ei_dark-age-tech"]              = startup("ei_dark-age-tech"),
  ["ei_steam-age-tech"]             = startup("ei_steam-age-tech"),
  ["ei_electricity-age-tech"]       = startup("ei_electricity-age-tech"),
  ["ei_computer-age-tech"]          = startup("ei_computer-age-tech"),
  ["ei_advanced-computer-age-tech"] = startup("ei_advanced-computer-age-tech"),
  ["ei_quantum-age-tech"]           = startup("ei_quantum-age-tech"),
  ["ei_fusion-quantum-age-tech"]    = startup("ei_fusion-quantum-age-tech"),
  ["ei_space-quantum-age-tech"]     = startup("ei_space-quantum-age-tech"),
  ["ei_exotic-age-tech"]            = startup("ei_exotic-age-tech"),
  ["ei_black-hole-exotic-age-tech"] = startup("ei_black-hole-exotic-age-tech")
}

return EI