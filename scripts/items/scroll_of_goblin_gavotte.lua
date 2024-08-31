-----------------------------------
-- ID: 5023
-- Scroll of Goblin Gavotte
-- Teaches the song Goblin Gavotte
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.GOBLIN_GAVOTTE)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.GOBLIN_GAVOTTE)
end

return itemObject
