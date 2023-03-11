---------------------------------------------------------------------------
--                        Technology Module                              --
---------------------------------------------------------------------------
local evaluateExpression = require(path_private_lib .. 'evaluate')

local SNI            = {}
local DEFAULT_WEIGHT = 1
local DEFAULT_VALUE  = 100
local MAX_LEVEL      = 500
local MAX_UINT32     = 0xFFFFFFFF
local MAX_INT64      = 0x7FFFFFFFFFFFFFFF
local MAX_DOUBLE     = 0x1.FFFFFFFFFFFFFP+1023

---------------------------------------------------------------------------
--                        Helper Functions                               --
---------------------------------------------------------------------------

-- @ ingredient: Prototype/Inredient
local function safeIngredientName(ingredient)
  if ingredient[1] ~= nil then return ingredient[1] end
  if ingredient.name ~= nil then return ingredient.name end
  if tostring(ingredient) ~= nil then return tostring(ingredient) end
  if ingredient ~= nil then return ingredient end
  log("[Compatibility coverage]: fatal error")
end

-- @ ingredient: Prototype/Inredient
local function safeIngredientAmount(ingredient)
  if ingredient[2] ~= nil then return ingredient[2] end
  if ingredient.amount ~= nil then return ingredient.amount end
  if tonumber(ingredient) ~= nil then return tonumber(ingredient) end
  if ingredient ~= nil then return ingredient end
  log("[Compatibility coverage]: fatal error")
end

-- return any value associated to a key
-- @ sciencePack: String
local function safeValue(sciencePack)
  sciencePack = safeIngredientName(sciencePack)
  if SNI.values[sciencePack] ~= nil then
    return SNI.values[sciencePack]
  else
    log("[Compatibility coverage]: science pack '" .. sciencePack .. "' value not found.")
    SNI.setValues({ [sciencePack] = DEFAULT_VALUE })
    return DEFAULT_VALUE
  end
end

-- Return any weight associated to a key
-- @ sciencePack: String
local function safeWeight(sciencePack)
  sciencePack = safeIngredientName(sciencePack)
  if SNI.weights[sciencePack] ~= nil then
    return SNI.weights[sciencePack]
  else
    log("[Compatibility coverage]: science pack '" .. sciencePack .. "' weight not found.")
    SNI.setWeights({ [sciencePack] = DEFAULT_WEIGHT })
    return DEFAULT_WEIGHT
  end
end

-- Limit max value
-- @ count: Number
local function safeCount(count)
  return math.min(MAX_INT64, count)
end

-- DEPRECATED
-- @ count: Number
local function safeFormula(count)
  local proposedFormula = tostring(count)
  if proposedFormula[2] == 'e' then
    return tostring(MAX_INT64)
  else
    return proposedFormula
  end
end

-- Filter ingredients from a Table, based on SNI's weights
-- @ ingredients: Table<{"ingredient", amount}>
local function filterIngredients(ingredients)
  local filteredIngredients = {}
  for _, v in pairs(ingredients) do
    local name = safeIngredientName(v)
    local amount = safeIngredientAmount(v)
    if safeWeight(name) == 1 then
      table.insert(filteredIngredients, { name, amount })
    end
  end
  if #filteredIngredients == 0 then
    if settings.startup["allow-empty-tech-cost"].value == true then return {} end
    for k, v in pairs(SNI.defaultPacks) do
      table.insert(filteredIngredients, { v[1], v[2] })
    end
  end
  return filteredIngredients
end

-- Compute default value of the technology
-- @ ingredients: Table<{"ingredient", amount}>
local function defaultValue(ingredients)
  local total = 0
  for _, v in pairs(ingredients) do
    local name = safeIngredientName(v)
    local amount = safeIngredientAmount(v)
    total = total + safeValue(name) * amount
  end
  if total == 0 then log("WARNING") end
  return total
end

-- Compute new value of the technology
-- @ ingredients: Table<{"ingredient", amount}>
local function rescaledValue(ingredients)
  ingredients = filterIngredients(ingredients)
  local total = 0
  for _, v in pairs(ingredients) do
    local name = safeIngredientName(v)
    local amount = safeIngredientAmount(v)
    total = total + safeWeight(name) * safeValue(name) * amount
  end
  if total == 0 then log("WARNING") end
  return 1 --0
end

-- Compute coefficient based on count * ratio
-- @ ingredients: Table<{"ingredient", amount}>
-- @ count: Number
local function coefficient(ingredients, count)
  count = count or 1
  local ratio = defaultValue(ingredients) / rescaledValue(ingredients)
  local coeff = safeCount(math.floor(count * ratio + 0.5))
  if coeff == 0 then return 1 else return coeff end
end

-- Wraps coefficient and previous formula
-- @ ingredients: Table<{"ingredient", amount}>
-- @ countFormula: String
local function wrapFormula(ingredients, countFormula)
  local coeff = coefficient(ingredients)
  ---@diagnostic disable-next-line: deprecated
  local exp = string.format("%.3f", math.log10(coeff))
  return "10^" .. exp .. "*(" .. countFormula .. ")"
end

-- Whether a Prototype/Technology has a count_formula or not
-- @ technology: Prototype/Technology
local function hasFormula(technology)
  if technology.unit.count_formula ~= nil then return true end
  return false
end

-- Returns max_level of a Prototype/Technology or MAX_LEVEL
-- @ technology: Prototype/Technology
local function hasMaxLevel(technology)
  if technology.max_level == "infinite" then
    return MAX_LEVEL
  elseif tonumber(technology.max_level) ~= nil then
    return tonumber(technology.max_level)
  else
    log("WARNING: " .. technology.name)
    return -1
  end
end

-- Moved to evaluate.lua
-- Compute the value of a formula
-- @ formula: String
-- @ param: Number
-- local function evaluateExpression(formula, param)
--  formula = formula:gsub("l", tostring(param))
--  formula = formula:gsub("L", tostring(param))
--  local func = assert(loadstring("return " .. formula))
--  return func()
--end

-- BinSearch for maximum level below limit
-- @ technology: Prototype/Technology
local function binarySearchMaxLevel(technology)
  local formula = technology.unit.count_formula
  local stop = hasMaxLevel(technology)
  local start = 1
  local level = 1

  while (start <= stop) do
    level = math.floor((start + stop) * 0.5)

    if (evaluateExpression(formula, level) >= MAX_INT64) then
      stop = level - 1
    else
      start = level + 1
    end
  end
  return level
end

--[[
-- BinSearch for maximum level below limit
-- @ technology: Prototype/Technology
local function binarySearchMaxLevel(technology)
  return 100
end
]]

-- @ name: String
-- @ level: Number
local function getRootName(name, level)
  local i = #name

  if tonumber(string.sub(name, i, i)) == nil then
    return name
  else
    while (tonumber(string.sub(name, i, i)) ~= nil) and (i > 0) do
      i = i - 1
    end
    local base = string.sub(name, 1, i)
    local level = tonumber(string.sub(name, i + 1, #name)) + 1
    return base
  end
end

-- @ technology: Prototype/Technology
-- @ level: Number
local function addInfiniteTechnologyFromLevel(technology, level, max_level)
  local newTech = table.deepcopy(data.raw.technology[technology.name])
  local unit = newTech.unit

  unit.count_formula = "9000000000000000"
  newTech.unit = unit
  newTech.visible_when_disabled = false
  if max_level ~= nil then
    newTech.max_level = max_level
  end
  newTech.name = getRootName(newTech.name, level) .. tostring(level)
  newTech.prerequisites = { getRootName(technology.name, level) .. tostring(1) }

  data:extend({ newTech })
end

-- @ technology: Prototype/Technology
-- @ level: Number
local function limitInfiniteTechnologyToLevel(technology, level)
  data.raw.technology[technology.name].max_level = level
end

---------------------------------------------------------------------------
--                           Class Methods                               --
---------------------------------------------------------------------------

-- Add value(s) for target key(s)
-- @ tableIn: Table<["key"] = value>
function SNI.setValues(tableIn)
  if not SNI.values then
    SNI.values = {}
  end
  for key, value in pairs(tableIn) do
    if SNI.values[key] ~= nil then
      -- default value will be the highest
      -- SNI.values[key] = math.max(SNI.values[key], value)
      SNI.values[key] = value
    else
      SNI.values[key] = value
    end
  end
end

-- Add weight(s) for target key(s)
-- @ tableIn: Table<["key"] = value>
function SNI.setWeights(tableIn)
  if not SNI.weights then
    SNI.weights = {}
  end
  for key, value in pairs(tableIn) do
    if SNI.weights[key] ~= nil then
      -- default value will be opt-out
      -- SNI.weights[key] = math.min(SNI.weights[key], value)
      SNI.weights[key] = value
    else
      SNI.weights[key] = value
    end
  end
end

-- Set DefaultPack(s)
-- @ ingredients: Table<{"ingredient", amount}>
function SNI.setDefaultPacks(ingredients)
  SNI.defaultPacks = ingredients
end

-- Add DefaultPack(s)
-- @ ingredients: Table<{"ingredient", amount}>
function SNI.addDefaultPacks(ingredients)
  if not SNI.defaultPacks then
    SNI.defaultPacks = {}
  end
  for _, v in pairs(ingredients) do
    table.insert(SNI.defaultPacks, { v[1], v[2] })
  end
end

-- DEPRECATED
--[[
-- Remove an ingredient in DefaultPacks
-- @ ingredients: Table<{"ingredient", amount}>
function SNI.removeDefaultPacks(ingredients)
  if not SNI.DefaultPacks then return end
  for _, ingredient in pairs(ingredients) do
    for i, pack in pairs(SNI.defaultPacks) do
      if pack[1] == ingredient[1] then
        SNI.defaultPacks[i] = nil
      end
    end
  end
end
]]

function SNI.removeAllDefaultPacks()
  SNI.defaultPacks = {}
end

-- Rescale LuaTechnology.unit
-- @ technology: Prototype/Technology
function SNI.sendInvite(technology)

  local unit = technology.unit

  if unit.count ~= nil then
    data.raw.technology[technology.name].unit = {
      ingredients = filterIngredients(unit.ingredients),
      count = coefficient(unit.ingredients, unit.count),
      time = unit.time
    }
  end

  if unit.count_formula ~= nil then
    data.raw.technology[technology.name].unit = {
      ingredients = filterIngredients(unit.ingredients),
      count_formula = wrapFormula(unit.ingredients, unit.count_formula),
      time = unit.time
    }
  end

end

-- Apply adjusted technologies
function SNI.sendInvites()
  for _, tech in pairs(data.raw.technology) do
    SNI.sendInvite(tech)
  end
end

-- Check integrity for infinite tech
function SNI.chechIntegrityInfiniteScience()
  for _, tech in pairs(data.raw.technology) do
    -- check if has formula
    if hasFormula(tech) then
      -- find max level
      default_max_level = hasMaxLevel(tech)
      reacheable_max_level = binarySearchMaxLevel(tech)

      if (default_max_level > reacheable_max_level) then
        -- add tech with const cost
        addInfiniteTechnologyFromLevel(tech, reacheable_max_level, default_max_level)
        -- cap tech to max level
        limitInfiniteTechnologyToLevel(tech, reacheable_max_level - 1)
      end
    end
  end
end

return SNI

---------------------------------------------------------------------------
