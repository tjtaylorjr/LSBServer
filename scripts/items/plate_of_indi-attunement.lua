-----------------------------------
-- ID: 6090
-- plate_of_indi-attunement
-- Teaches INDI-ATTUNEMENT
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.INDI_ATTUNEMENT)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.INDI_ATTUNEMENT)
end

return itemObject
