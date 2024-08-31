-----------------------------------
-- ID: 6089
-- plate_of_indi-focus
-- Teaches INDI-FOCUS
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.INDI_FOCUS)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.INDI_FOCUS)
end

return itemObject
