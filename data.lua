---------------------------------------------------------------------------
-- -- -- PRE INITIALIZATION
---------------------------------------------------------------------------
-- General Info
mod                               = {} 
mod.internal_name                 = "science-not-invited"
mod.title_name                    = "Science Not Invited"
mod.version                       = mods[mod.internal_name]
mod.stage                         = "data"

-- -- Global Mod paths
require("__" .. mod.internal_name .. "__/lib/public/paths")

---------------------------------------------------------------------------
-- -- -- CONTENTS INITIALIZATION (data stage)
---------------------------------------------------------------------------
require(path_p_vanilla_changes    .. "__init__")
