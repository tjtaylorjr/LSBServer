-----------------------------------
-- ID: 4880
-- Scroll of Absorb-CHR
-- Teaches the black magic Absorb-CHR
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.ABSORB_CHR)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.ABSORB_CHR)
end

return itemObject
