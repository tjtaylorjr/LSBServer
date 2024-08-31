-----------------------------------
-- ID: 6073
-- plate_of_indi-regen
-- Teaches INDI-REGEN
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.INDI_REGEN)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.INDI_REGEN)
end

return itemObject
