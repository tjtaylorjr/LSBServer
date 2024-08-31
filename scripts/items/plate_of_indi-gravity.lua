-----------------------------------
-- ID: 6101
-- plate_of_indi-gravity
-- Teaches INDI-GRAVITY
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.INDI_GRAVITY)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.INDI_GRAVITY)
end

return itemObject
