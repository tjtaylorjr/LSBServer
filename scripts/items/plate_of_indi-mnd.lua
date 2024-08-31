-----------------------------------
-- ID: 6081
-- plate_of_indi-mnd
-- Teaches INDI-MND
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.INDI_MND)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.INDI_MND)
end

return itemObject
