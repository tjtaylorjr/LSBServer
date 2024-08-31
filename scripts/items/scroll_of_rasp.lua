-----------------------------------
-- ID: 4846
-- Scroll of Rasp
-- Teaches the black magic Rasp
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.RASP)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.RASP)
end

return itemObject
