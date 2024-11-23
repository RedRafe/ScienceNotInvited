sni.stage = "data-updates"
---------------------------------------------------------------------------

SNI.addDefaultPacks({{"automation-science-pack", 1}})

if mods['space-age'] then
  local SA = require(path_c_space_age .. "data")

  SNI.setWeights(SA.weights)
  SNI.setValues(SA.values)
end

-- -- Space Exploration
if mods['space-exploration'] then 
  local SpaceExploration = require(path_c_space_exploration .. "data")

  SpaceExploration.loadSettings()
  SNI.setWeights(SpaceExploration.weights)
  SNI.setValues(SpaceExploration.values)
end

-- -- Krastorio2
if mods["Krastorio2"] then
  local Krastorio2 = require(path_c_krastorio2 .. "data")

  SNI.setWeights(Krastorio2.weights)
  SNI.setValues(Krastorio2.values)

  SNI.removeAllDefaultPacks()
  SNI.addDefaultPacks({{"basic-tech-card", 1}})
end

-- -- Krastorio2 and Space Exploration
if mods["Krastorio2"] and mods['space-exploration'] then 
  local K2SE = require(path_c_k2se .. "data")

  SNI.setWeights(K2SE.weights)
  SNI.setValues(K2SE.values)
end

-- -- Angel's
if mods['angelsbioprocessing'] then
  local Angels = require(path_c_angels .. "data")

  SNI.setWeights(Angels.weights)
  SNI.setValues(Angels.values)
end

-- -- Bob's
if mods['bobmodules'] or mods['bobtech'] then
  local Bobs = require(path_c_bobs .. "data")

  SNI.setWeights(Bobs.weights)
  SNI.setValues(Bobs.values)
end

-- -- Bob's + Angel's
if mods['bobtech'] and mods['angelsrefining'] then
  local BobsAngels = require(path_c_bobsangels .. "data")

  SNI.setValues(BobsAngels.values)
end

-- -- Darkstar
if mods['Darkstar_utilities'] then
  local Darkstar = require(path_c_darkstar .. "data")

  SNI.setWeights(Darkstar.weights)
  SNI.setValues(Darkstar.values)
end

if mods['exotic-industries'] then
  local EI = require(path_c_ei .. "data")

  SNI.setWeights(EI.weights)
  SNI.setValues(EI.values)

  SNI.removeAllDefaultPacks()
  SNI.addDefaultPacks({{"ei_dark-age-tech", 1}})
end

-- -- StarsWithSakura
if mods["StarsWithSakura"] then
  local Sakura = require(path_c_sakura .. "data")

  SNI.setWeights(Sakura.weights)
  SNI.setValues(Sakura.values)

  SNI.removeAllDefaultPacks()
  SNI.addDefaultPacks({{"inspiration", 1}})
end