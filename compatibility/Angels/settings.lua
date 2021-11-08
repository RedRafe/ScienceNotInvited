if mods['angelsbioprocessing'] then

  data:extend({
    -- -- Basic science
    {
      type           = "bool-setting",
      name           = "token-bio",
      default_value  = true,
      setting_type   = "startup",
      order          = "AA-AB-S1"
    }
  })
  
end