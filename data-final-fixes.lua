sni.stage = "data-final-fixes"
---------------------------------------------------------------------------

if (not SNI.defaultPacks) or (#SNI.defaultPacks == 0) then
  SNI.addDefaultPacks({{"automation-science-pack", 1}})
end

SNI.sendInvites()
--SNI.chechIntegrityInfiniteScience()
