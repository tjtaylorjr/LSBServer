-----------------------------------
-- ID: 5069
-- Scroll of Dark Threnody
-- Teaches the song Dark Threnody
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.DARK_THRENODY)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.DARK_THRENODY)
end

return itemObject
