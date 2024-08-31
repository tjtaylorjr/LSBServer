-----------------------------------
-- ID: 6082
-- plate_of_indi-chr
-- Teaches INDI-CHR
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.INDI_CHR)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.INDI_CHR)
end

return itemObject
