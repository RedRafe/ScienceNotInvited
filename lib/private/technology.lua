local SNI = {}
local DEFAULT_VALUE = 100

local function safeValue(sciencePack)
  if SNI.value[sciencePack] ~= nil then 
    return SNI.value[sciencePack]
  else 
    print("ERROR: Science pack " .. sciencePack .. " not found.")
    return DEFAULT_VALUE
  end
end

local function safeWeight(sciencePack)
  if SNI.weights[sciencePack] ~= nil then 
    return SNI.weights[sciencePack]
  else
    print("ERROR: Science pack " .. sciencePack .. " not found.")
    return 0
  end
end

local function safeCount(count)
  return math.min(10000000000000, count)
end

local function safeFormula(count)
  proposedFormula = tostring(count)
  if proposedFormula[2] == 'e' then
    return '10000000000000'
  else
    return proposedFormula
  end
end

local function filterIngredients(ingredients)
  filteredIngredients = {}
  for _, v in pairs(ingredients) do
    if SNI.weights[v[1]] == 1 then
      table.insert(filteredIngredients, {v[1], v[2]})
    end
  end
  if #filteredIngredients == 0 then
    table.insert(filteredIngredients, {"automation-science-pack", 1})
  end
  return filteredIngredients
end

local function defaultValue(ingredients)
  local total = 0
  for _, v in pairs(ingredients) do
    total = total + SNI.values[v[1]] * v[2]
  end
  return total
end

local function rescaledValue(ingredients)
  local total = 0
  for _, v in pairs(ingredients) do
    total = total + SNI.weights[v[1]] * SNI.values[v[1]] * v[2]
  end
  return total
end

local function coefficient(ingredients, count)
  count = count or 1
  ratio = defaultValue(ingredients) / rescaledValue(filterIngredients(ingredients))
  return safeCount(math.floor(count * ratio + 0.5))
end

local function rescaleIngredients(ingredients)
  filteredIngredients = {}
  for _, v in pairs(ingredients) do
    if SNI.weights[v[1]] == 1 then
      table.insert(filteredIngredients, {v[1], 1})
    end
  end
  if #filteredIngredients == 0 then
    table.insert(filteredIngredients, {"automation-science-pack", 1})
  end
  return filteredIngredients
end

function SNI.setValues(tableIn)
  if not SNI.values then
    SNI.values = {}
  end
  -- default value will be the highest
  for key, value in pairs(tableIn) do
    if SNI.values[key] ~= nil then
      SNI.values[key] = math.max(SNI.values[key], value)
    else
      SNI.values[key] = value
    end
  end
end

function SNI.setWeights(tableIn)
  if not SNI.weights then
    SNI.weights = {}
  end
  -- default value will be opt-out
  for key, value in pairs(tableIn) do
    if SNI.weights[key] ~= nil then
      SNI.weights[key] = math.min(SNI.weights[key], value)
    else
      SNI.weights[key] = value
    end
  end
end

function SNI.sendInvite(technology)

  local unit = technology.unit

  if unit.count ~= nil then
    data.raw.technology[technology.name].unit = {
      ingredients = rescaleIngredients(unit.ingredients),
      count = coefficient(unit.ingredients, unit.count),
      time = unit.time
    }
  end

  if unit.count_formula ~= nil then
    data.raw.technology[technology.name].unit = {
      ingredients = rescaleIngredients(unit.ingredients),
      count_formula = safeFormula(coefficient(unit.ingredients)) .. "*(" .. unit.count_formula .. ")",
      time = unit.time
    }
  end
  
end

function SNI.sendInvites()
  for _, tech in pairs(data.raw.technology) do
    SNI.sendInvite(tech)
  end
end

return SNI