---------------------------------------------------------------------------
--                  Evaluate Expression Method                           --
---------------------------------------------------------------------------

-- Define precedence of operations
-- @ op: String
local function precedence(op)
  if (op == "+" or op == "-") then 
    return 1
  end
  if (op == "*" or op == "/") then
    return 2
  end
  if (op == "^") then
    return 3
  end
  return 0
end

-- Perform arithmetic operations
-- @ a: Number
-- @ b: Number
-- @ op: String
local function applyOp(a, b, op)
  if op == '^' then
    return a ^ b
  elseif op == '*' then
    return a * b
  elseif op == '/' then
    return a / b
  elseif op == '+' then
    return a + b
  elseif op == '-' then
    return a - b
  else
    log("ERROR: invalid operand " .. op)
  end
end

-- Evaluate expression
-- @ tokens: String
local function evaluate(tokens)
  local values = {}
  local ops = {}
  local i = 1

  while(i <= #tokens) do
    -- current token is white space -> skip it
    if string.sub(tokens, i, i) == ' ' then
      i = i + 1

    -- current token is an opening brace, push it to 'ops'
    elseif string.sub(tokens, i, i) == '(' then
      table.insert(ops, string.sub(tokens, i, i))

    -- current token is a number, push it to stack numbers
    elseif tonumber(string.sub(tokens, i, i)) ~= nil then
      -- there might be more digits
      local val = ''
      while(i <= #tokens and (tonumber(string.sub(tokens, i, i)) ~= nil or string.sub(tokens, i, i) == '.')) do
        val = val .. string.sub(tokens, i, i)
        i = i + 1
      end

      table.insert(values, tonumber(val))
      i = i - 1

    -- closing brace, solve entire brace
    elseif string.sub(tokens, i, i) == ')' then
      
      while #ops ~= 0 and ops[#ops] ~= '(' do
        val2 = values[#values]
        values[#values] = nil
        val1 = values[#values]
        values[#values] = nil
        op = ops[#ops]
        ops[#ops] = nil

        table.insert(values, applyOp(val1, val2, op))
      end

      ops[#ops] = nil

    -- current token is an operator
    else
      while #ops ~= 0 and precedence(ops[#ops]) >= precedence(string.sub(tokens, i, i)) do
        val2 = values[#values]
        values[#values] = nil
        val1 = values[#values]
        values[#values] = nil
        op = ops[#ops]
        ops[#ops] = nil

        table.insert(values, applyOp(val1, val2, op))
      end
      table.insert(ops, (string.sub(tokens, i, i)))
    end

    i = i + 1
  end

  -- Compute remaining operations
  while #ops ~= 0 do
    val2 = values[#values]
    values[#values] = nil
    val1 = values[#values]
    values[#values] = nil
    op = ops[#ops]
    ops[#ops] = nil

    table.insert(values, applyOp(val1, val2, op))
  end

  -- final value is at the top, return it
  return values[#values]
end

-- Public method to evaluate an expression
-- @ formula: String
-- @ param: Number
function evaluateExpression(formula, param)
  formula = formula:gsub("l", tostring(param))
  formula = formula:gsub("L", tostring(param))
  return evaluate(formula)
end

return evaluateExpression