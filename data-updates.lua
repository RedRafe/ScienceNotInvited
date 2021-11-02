sni.stage = "data-updates"
---------------------------------------------------------------------------

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

-- -- Bob's
if mods['bobmodules'] or mods['bobtech'] then
  Bobs = require(path_c_bobs .. "data")

  SNI.setWeights(Bobs.weights)
  SNI.setValues(Bobs.values)
end