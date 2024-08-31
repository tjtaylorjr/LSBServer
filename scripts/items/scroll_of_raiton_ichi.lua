-----------------------------------
-- ID: 4940
-- Scroll of Raiton: Ichi
-- Teaches the ninjutsu Raiton: Ichi
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.RAITON_ICHI)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.RAITON_ICHI)
end

return itemObject
