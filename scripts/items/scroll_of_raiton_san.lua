-----------------------------------
-- ID: 4942
-- Scroll of Raiton: San
-- Teaches the ninjutsu Raiton: San
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.RAITON_SAN)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.RAITON_SAN)
end

return itemObject
