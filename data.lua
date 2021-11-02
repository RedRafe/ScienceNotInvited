---------------------------------------------------------------------------
-- -- -- PRE INITIALIZATION
---------------------------------------------------------------------------
-- General Info
sni                               = {} 
sni.internal_name                 = "science-not-invited"
sni.title_name                    = "Science Not Invited"
sni.version                       = mods[sni.internal_name]
sni.stage                         = "data"

-- -- Global Mod paths
require("__" .. sni.internal_name .. "__/lib/public/paths")

---------------------------------------------------------------------------
-- -- -- CONTENTS INITIALIZATION (data stage)
---------------------------------------------------------------------------
require(path_p_vanilla_changes    .. "__init__")
