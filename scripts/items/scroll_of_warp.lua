-----------------------------------
-- ID: 4869
-- Scroll of Warp
-- Teaches the black magic Warp
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.WARP)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.WARP)
end

return itemObject
