-- Table of points value per science packs based on raw resources
local points = {
  ["automation-science-pack"] =   1.2, -- Red science
  ["logistic-science-pack"]   =   2.4, -- Green science
  ["military-science-pack"]   =   7.5, -- Black science
  ["chemical-science-pack"]   =  22.5, -- Blue science
  ["production-science-pack"] =  82.5, -- Purple science
  ["utility-science-pack"]    =  85.0, -- Yellow science
  ["space-science-pack"]      = 280.0  -- Space science
}

local key = {
  [1] = "automation-science-pack",
  [2] = "logistic-science-pack",
  [3] = "military-science-pack",
  [4] = "chemical-science-pack",
  [5] = "production-science-pack",
  [6] = "utility-science-pack",
  [7] = "space-science-pack"
}

local values  = {}
local weights = {}

for i = 1, #key do
  weights[key[i]] = settings.startup["science-" .. tostring(i)].value and 1 or 0
  values[key[i]]  = weights[key[i]] * points[key[i]]
end

local function filterIngredients(ingredients)
  filteredIngredients = {}
  for _, v in pairs(ingredients) do
    if weights[v[1]] == 1 then
      table.insert(filteredIngredients, {v[1], v[2]})
    end
  end
  return filteredIngredients
end

local function defaultValue(ingredients)
  local total = 0
  for i, v in pairs(ingredients) do
    total = total + points[v[1]] * v[2]
  end
  return total
end

local function rescaledValue(ingredients)
  local total = 0
  for i, v in pairs(ingredients) do
    total = total + values[v[1]] * v[2]
  end
  return total
end

local function coefficient(ingredients, count)
  count = count or 1
  return math.floor(count * defaultValue(ingredients) / rescaledValue(filterIngredients(ingredients)) + 0.5)
end

local function rescaleIngredients(ingredients)
  filteredIngredients = {}
  for _, v in pairs(ingredients) do
    if weights[v[1]] == 1 then
      table.insert(filteredIngredients, {v[1], 1})
    end
  end
  return filteredIngredients
end

-- loop all techs to rescale them
for _, tech in pairs(data.raw.technology) do

  local unit = tech.unit
  
  if unit.count ~= nil then
    data.raw.technology[tech.name].unit = {
      ingredients = rescaleIngredients(unit.ingredients),
      count = coefficient(unit.ingredients, unit.count),
      time = unit.time
    }
  else
    data.raw.technology[tech.name].unit = {
      ingredients = rescaleIngredients(unit.ingredients),
      count_formula = unit.count_formula .. "*" .. tostring(coefficient(unit.ingredients)),
      time = unit.time
    }
  end
end
