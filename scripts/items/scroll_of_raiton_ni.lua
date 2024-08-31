-----------------------------------
-- ID: 4941
-- Scroll of Raiton: Ni
-- Teaches the ninjutsu Raiton: Ni
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.RAITON_NI)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.RAITON_NI)
end

return itemObject
