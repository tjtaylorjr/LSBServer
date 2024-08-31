-----------------------------------
-- ID: 6100
-- plate_of_indi-paralysis
-- Teaches INDI-PARALYSIS
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.INDI_PARALYSIS)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.INDI_PARALYSIS)
end

return itemObject
