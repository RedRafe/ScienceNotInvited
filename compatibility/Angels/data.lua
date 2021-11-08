local startup = require(path_public_lib .. "utils").startup

local Angels = {}

Angels.values = {
    -- Basic science
    ["automation-science-pack"]        =   4.0,
    ["logistic-science-pack"]          =   9.3,
    ["military-science-pack"]          =  29.5,
    ["chemical-science-pack"]          =  38.0,
    ["production-science-pack"]        = 158.0,
    ["utility-science-pack"]           = 170.0,
    ["space-science-pack"]             = 495.0,
    -- Angel's
    ["token-bio"]                      =  30.0,
}

Angels.weights = {
    -- Angel's
    ["token-bio"] = startup("token-bio")
}

return Angels