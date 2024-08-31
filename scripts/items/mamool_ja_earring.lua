-----------------------------------
-- ID: 16012
-- Mamool Ja Earring
--  This earring functions in the same way as the spell Reraise III.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local duration = 3600
    target:delStatusEffect(xi.effect.RERAISE)
    target:addStatusEffect(xi.effect.RERAISE, 3, 0, duration)
end

return itemObject
