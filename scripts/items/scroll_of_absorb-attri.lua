-----------------------------------
-- ID: 4887
-- Scroll of Absorb-Atri
-- Teaches the black magic Absorb-Atri
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.ABSORB_ATTRI)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.ABSORB_ATTRI)
end

return itemObject
