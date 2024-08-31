-----------------------------------
-- ID: 4952
-- Scroll of Hojo: Ichi
-- Teaches the ninjutsu Hojo: Ichi
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.HOJO_ICHI)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.HOJO_ICHI)
end

return itemObject
