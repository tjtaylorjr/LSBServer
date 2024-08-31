-----------------------------------
-- ID: 4968
-- Scroll of Kakka: Ichi
-- Teaches the ninjutsu Kakka: Ichi
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.KAKKA_ICHI)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.KAKKA_ICHI)
end

return itemObject
