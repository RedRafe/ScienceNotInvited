local startup = require(path_public_lib .. "utils").startup

local SpaceExploration = {}

SpaceExploration.values = {
  ["automation-science-pack"]       =    3.0, -- Red science
  ["logistic-science-pack"]         =    7.0, -- Green science
  ["military-science-pack"]         =   24.5, -- Black science
  ["chemical-science-pack"]         =   68.0, -- lue science
  ["production-science-pack"]       =  207.0, -- Purple science
  ["utility-science-pack"]          =  240.0, -- Yellow science
  ["space-science-pack"]            =  163.0, -- Space science
                                              -- ORES +  PET + H.O.                                
  ["se-rocket-science-pack"]        =  163.0, --   32 +  7 6 + 55

  ["se-astronomic-science-pack-1"]  = 3520.0, -- 1987 +  660 + 877
  ["se-astronomic-science-pack-2"]  = 3780.0, -- 1235 +  400 + 383 + 1/2 tier1 
  ["se-astronomic-science-pack-3"]  = 3765.0, --  582 +  408 + 256 + 2/3 tier2
  ["se-astronomic-science-pack-4"]  = 4130.0, --  452 +  544 + 310 + 3/4 tier3

  ["se-biological-science-pack-1"]  = 2370.0, -- 1350 +  912 + 105
  ["se-biological-science-pack-2"]  = 7100.0, -- 3263 + 2643 +  15 + 1/2 tier1
  ["se-biological-science-pack-3"]  = 6800.0, -- 1510 +  536 +  17 + 2/3 tier2*
  ["se-biological-science-pack-4"]  = 7390.0, -- 1609 +  630 +  52 + 3/4 tier3*

  ["se-energy-science-pack-1"]      = 3100.0, -- 2493 +  538 +  72
  ["se-energy-science-pack-2"]      = 3145.0, -- 1108 +  443 +  44 + 1/2 tier1
  ["se-energy-science-pack-3"]      = 3260.0, --  780 +  348 +  37 + 2/3 tier2
  ["se-energy-science-pack-4"]      = 4990.0, -- 1351 + 1130 +  67 + 3/4 tier3

  ["se-material-science-pack-1"]    = 2350.0, -- 1257 + 1023 +  86
  ["se-material-science-pack-2"]    = 1985.0, --  421 +  349 +  40 + 1/2 tier1
  ["se-material-science-pack-3"]    = 1520.0, --  417 +  270 +  33 + 2/3 tier2
  ["se-material-science-pack-4"]    = 3900.0, -- 1567 + 1169 +  20 + 3/4 tier3

  ["se-deep-space-science-pack-1"]  = 91000,  --  52k + 38,6k + 425
  ["se-deep-space-science-pack-2"]  = 87000,  -- estimated
  ["se-deep-space-science-pack-3"]  = 84000,  -- estimated
  ["se-deep-space-science-pack-4"]  = 150000  -- estimated
}

local keywords = {
  "space-exploration-pack",
  "se-rocket-science-pack",
  "se-astronomic-science-pack",
  "se-biological-science-pack",
  "se-energy-science-pack",
  "se-material-science-pack",
  "se-deep-space-science-pack"
}

function SpaceExploration.getSettings()
  SpaceExploration.settings = {}
  for _, key in pairs(keywords) do
    SpaceExploration.settings[key] = settings.startup[key].value
  end
end

function SpaceExploration.getWeights()
  SpaceExploration.weights = {}

  -- Rocket Science = Space Science
  SpaceExploration.weights["se-rocket-science-pack"] = SpaceExploration.settings["se-rocket-science-pack"] and 1 or 0

  -- Tiered science
  local maxTier = SpaceExploration.settings["space-exploration-pack"]
  local tierScience = {"se-astronomic-science-pack", "se-biological-science-pack", "se-energy-science-pack", "se-material-science-pack", "se-deep-space-science-pack"}

  for _, sp in pairs(tierScience) do
    for tier = 1, 4 do
      if tier <= maxTier then
        SpaceExploration.weights[sp .. '-' .. tostring(tier)] = SpaceExploration.settings[sp] and 1 or 0
      else
        SpaceExploration.weights[sp .. '-' .. tostring(tier)] = 0
      end
    end
  end
end

function SpaceExploration.loadSettings()
  SpaceExploration.getSettings()
  SpaceExploration.getWeights()
end

return SpaceExploration