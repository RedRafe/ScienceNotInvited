sni.stage = "data-final-fixes"
---------------------------------------------------------------------------

SNI.sendInvites()
--SNI.chechIntegrityInfiniteScience()

for k, v in pairs(SNI.values) do
  log('Pack: ' .. tostring(k) .. ' Value: ' .. tostring(v) .. ' Weight: ' .. tostring(SNI.weights[k]))
end