-----------------------------------
-- ID: 4845
-- Scroll of Choke
-- Teaches the black magic Choke
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.CHOKE)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.CHOKE)
end

return itemObject
