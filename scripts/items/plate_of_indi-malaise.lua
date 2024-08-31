-----------------------------------
-- ID: 6094
-- plate_of_indi-malaise
-- Teaches INDI-MALAISE
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.INDI_MALAISE)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.INDI_MALAISE)
end

return itemObject
