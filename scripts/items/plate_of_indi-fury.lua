-----------------------------------
-- ID: 6083
-- plate_of_indi-fury
-- Teaches INDI-FURY
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.INDI_FURY)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.INDI_FURY)
end

return itemObject
