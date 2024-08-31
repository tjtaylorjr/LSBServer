-----------------------------------
-- ID: 4934
-- Scroll of Huton: Ichi
-- Teaches the ninjutsu Huton: Ichi
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.HUTON_ICHI)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.HUTON_ICHI)
end

return itemObject
