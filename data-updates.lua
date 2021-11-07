sni.stage = "data-updates"
---------------------------------------------------------------------------

SNI.addDefaultPacks({{"automation-science-pack", 1}})

-- -- Space Exploration
if mods['space-exploration'] then 
  SpaceExploration = require(path_c_space_exploration .. "data")

  SpaceExploration.loadSettings()
  SNI.setWeights(SpaceExploration.weights)
  SNI.setValues(SpaceExploration.values)
end

-- -- Krastorio2
if mods["Krastorio2"] then
end

-- -- Angel's
if mods['angelsbioprocessing'] then
  Angels = require(path_c_angels .. "data")

  SNI.setWeights(Angels.weights)
  SNI.setValues(Angels.values)
end

-- -- Bob's
if mods['bobmodules'] or mods['bobtech'] then
  Bobs = require(path_c_bobs .. "data")

  SNI.setWeights(Bobs.weights)
  SNI.setValues(Bobs.values)
end

-- -- Bob's + Angel's
if mods['bobtech'] and mods['angelsrefining'] then
  BobsAngels = require(path_c_bobsangels .. "data")

  SNI.setValues(BobsAngels.values)
end

if mods["Krastorio2"] then
  Krastorio2 = require(path_c_krastorio2 .. "data")

  SNI.setWeights(Krastorio2.weights)
  SNI.setValues(Krastorio2.values)

  SNI.removeDefaultPacks({{"automation-science-pack", 1}})
  SNI.addDefaultPacks({{"basic-tech-card", 1}})
end