-----------------------------------
-- ID: 6079
-- plate_of_indi-agi
-- Teaches INDI-AGI
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.INDI_AGI)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.INDI_AGI)
end

return itemObject
