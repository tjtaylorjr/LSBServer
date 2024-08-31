-----------------------------------
-- ID: 6091
-- plate_of_indi-wilt
-- Teaches INDI-WILT
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.INDI_WILT)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.INDI_WILT)
end

return itemObject
