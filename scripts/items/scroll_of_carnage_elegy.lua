-----------------------------------
-- ID: 5030
-- Scroll of Carnage Elegy
-- Teaches the song Carnage Elegy
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.CARNAGE_ELEGY)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.CARNAGE_ELEGY)
end

return itemObject
