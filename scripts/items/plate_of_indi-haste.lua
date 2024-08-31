-----------------------------------
-- ID: 6131
-- plate_of_indi-haste
-- Teaches INDI-HASTE
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.INDI_HASTE)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.INDI_HASTE)
end

return itemObject
