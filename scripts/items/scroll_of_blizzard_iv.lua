-----------------------------------
-- ID: 4760
-- Scroll of Blizzard IV
-- Teaches the black magic Blizzard IV
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.BLIZZARD_IV)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.BLIZZARD_IV)
end

return itemObject
