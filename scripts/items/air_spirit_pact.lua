-----------------------------------
-- ID: 4898
-- Air Spirit Pact
-- Teaches the summoning magic Air Spirit
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.AIR_SPIRIT)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.AIR_SPIRIT)
end

return itemObject
