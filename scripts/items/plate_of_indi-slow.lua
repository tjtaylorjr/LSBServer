-----------------------------------
-- ID: 6099
-- plate_of_indi-slow
-- Teaches INDI-SLOW
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.INDI_SLOW)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.INDI_SLOW)
end

return itemObject
